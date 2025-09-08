# =========================
# Enable PowerShell Remoting (HTTPS only, LocalSubnet restricted)
# powershell -ExecutionPolicy Bypass -File .\winrm.ps1
# =========================

# User-configurable variables
$allowLocalUsers = $false # Set to $true to enable local accounts via WinRM

# Ensure script is running as Administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Error "This script must be run as Administrator."
    exit 1
}

Write-Host "=== Enabling WinRM HTTPS remoting ==="

# Ensure WinRM service is enabled
Enable-PSRemoting -Force

# Remove HTTP listener if present
$httpListener = winrm enumerate winrm/config/Listener | Select-String -Pattern "Transport = HTTP"
if ($httpListener) {
    Write-Host "Removing existing HTTP listener..."
    winrm delete winrm/config/Listener?Address=*+Transport=HTTP
} else {
    Write-Host "No HTTP listener found. Skipping..."
}

# Clean up old firewall rules
$fwRules = @(
    "Windows Remote Management (HTTP-In)",
    "Windows Remote Management (HTTPS-In)",
    "Windows Remote Management (HTTPS-In) [LocalSubnet]"
)
foreach ($rule in $fwRules) {
    $existing = Get-NetFirewallRule -DisplayName $rule -ErrorAction SilentlyContinue
    if ($existing) {
        Write-Host "Removing firewall rule: $rule"
        Remove-NetFirewallRule -DisplayName $rule
    }
}

# Ensure self-signed cert exists (reuse if already present)
$certSubject = "CN=$env:COMPUTERNAME"
$cert = Get-ChildItem -Path Cert:\LocalMachine\My |
    Where-Object { $_.Subject -eq $certSubject -and $_.NotAfter -gt (Get-Date) } |
    Sort-Object NotAfter -Descending |
    Select-Object -First 1

if (-not $cert) {
    Write-Host "Creating new self-signed certificate..."
    $certParams = @{
        CertStoreLocation = 'Cert:\LocalMachine\My'
        DnsName           = $env:COMPUTERNAME
        NotAfter          = (Get-Date).AddYears(10)
        Provider          = 'Microsoft Software Key Storage Provider'
        Subject           = $certSubject
    }
    $cert = New-SelfSignedCertificate @certParams
} else {
    Write-Host "Reusing existing certificate: $($cert.Thumbprint)"
}

# Remove old HTTPS listener if it exists
$httpsListener = winrm enumerate winrm/config/Listener | Select-String -Pattern "Transport = HTTPS"
if ($httpsListener) {
    Write-Host "Removing existing HTTPS listener..."
    winrm delete winrm/config/Listener?Address=*+Transport=HTTPS
}

# Create HTTPS listener with the cert
Write-Host "Creating new HTTPS listener..."
$httpsParams = @{
    ResourceURI = 'winrm/config/Listener'
    SelectorSet = @{
        Transport = "HTTPS"
        Address   = "*"
    }
    ValueSet = @{
        CertificateThumbprint = $cert.Thumbprint
        Enabled               = $true
    }
}
New-WSManInstance @httpsParams

# Add firewall rule for HTTPS (5986) restricted to LocalSubnet
$firewallParams = @{
    Action        = 'Allow'
    Description   = 'Inbound rule for Windows Remote Management via WS-Management (HTTPS) - Local subnet only'
    Direction     = 'Inbound'
    DisplayName   = 'Windows Remote Management (HTTPS-In) [LocalSubnet]'
    LocalPort     = 5986
    Profile       = 'Domain,Private' # exclude Public
    Protocol      = 'TCP'
    RemoteAddress = 'LocalSubnet'
}
New-NetFirewallRule @firewallParams

# Optional: allow local accounts
if ($allowLocalUsers) {
    Write-Host "`n=== Configuring local user access for WinRM ==="

    # Enable basic authentication
    Set-Item -Path WSMan:\localhost\Service\Auth\Basic -Value $true
    Write-Host "Basic authentication enabled."

    # Ensure unencrypted traffic is not allowed (safe since HTTPS is enabled)
    Set-Item -Path WSMan:\localhost\Service\AllowUnencrypted -Value $false
    Write-Host "Unencrypted traffic disabled."

    # Allow local accounts to connect via WinRM
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" `
                     -Name LocalAccountTokenFilterPolicy `
                     -Value 1 -Type DWord
    Write-Host "Local accounts allowed for WinRM connections."
}

# Show final listener config
Write-Host "`n=== Current WinRM Listeners ==="
winrm enumerate winrm/config/Listener
