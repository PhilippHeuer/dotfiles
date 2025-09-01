## Function: Install Sys Font
function Install-SysFont {
    <#
      Installs .ttf/.otf fonts system-wide (all users):
        - copies to  C:\Windows\Fonts
        - registers under "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts"
        - broadcasts WM_FONTCHANGE so new apps see it immediately
      Usage:
        .\Install-SysFont.ps1 "C:\path\to\Some-Font.ttf"
        .\Install-SysFont.ps1 "C:\path\to\font1.ttf","C:\path\to\font2.otf"
    #>

    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory,
                   Position = 0,
                   ValueFromPipeline,
                   ValueFromPipelineByPropertyName)]
        [Alias('Path')]
        [string[]] $FontPath
    )

    begin {
        if (-not ([Type]::GetType('FontApi.Native'))) {
$src = @"
using System;
using System.Runtime.InteropServices;
using System.Text;

namespace FontApi
{
    public static class Native
    {
        [DllImport("gdi32.dll", CharSet = CharSet.Unicode)]
        public static extern int AddFontResourceExW(
            string lpFileName, uint fl, IntPtr pdv);

        [DllImport("gdi32.dll", CharSet = CharSet.Unicode)]
        public static extern int GetFontResourceInfoW(
            string lpFileName, ref int cbBuffer, StringBuilder lpBuffer, uint dwQueryType);

        [DllImport("user32.dll")]
        public static extern int SendMessageW(
            IntPtr hWnd, uint Msg, IntPtr wParam, IntPtr lParam);
    }
}
"@
            Add-Type -TypeDefinition $src -PassThru | Out-Null
        }

        $FR_PRIVATE       = 0x10
        $GFRI_DESCRIPTION = 1
        $WM_FONTCHANGE    = 0x001D
        $HWND_BROADCAST   = [IntPtr]0xFFFF

        $FontsDir = Join-Path $env:WINDIR 'Fonts'
        $RegPath  = 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts'

        if (-not ([Security.Principal.WindowsPrincipal] `
                  [Security.Principal.WindowsIdentity]::GetCurrent()
                 ).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)) {
            throw 'Install-SysFont must run elevated.'
        }
    }

    process {
        foreach ($inItem in $FontPath) {
            foreach ($rp in Resolve-Path $inItem -ErrorAction Stop) {

                $src      = $rp.ProviderPath
                $fileName = Split-Path $src -Leaf
                $dst      = Join-Path  $FontsDir $fileName

                if ($PSCmdlet.ShouldProcess($fileName, 'Install system font')) {

                    Copy-Item -LiteralPath $src -Destination $dst -Force

                    [void][FontApi.Native]::AddFontResourceExW($dst, $FR_PRIVATE, [IntPtr]::Zero)

                    $len = 0
                    [void][FontApi.Native]::GetFontResourceInfoW($dst, [ref]$len, $null, $GFRI_DESCRIPTION)
                    $sb  = New-Object System.Text.StringBuilder ($len)
                    [void][FontApi.Native]::GetFontResourceInfoW($dst, [ref]$len, $sb, $GFRI_DESCRIPTION)
                    $friendly = $sb.ToString().Trim()

                    $suffix  = if ($fileName -match '\.tt[cf]$') { ' (TrueType)' } else { ' (OpenType)' }
                    $regName = "$friendly$suffix"

                    if (-not (Get-ItemProperty -Path $RegPath -Name $regName -ErrorAction SilentlyContinue)) {
                        New-ItemProperty -Path $RegPath -Name $regName `
                                         -PropertyType String -Value $fileName | Out-Null
                    }
                }
            }
        }
    }

    end {
        [void][FontApi.Native]::SendMessageW($HWND_BROADCAST,
                                            $WM_FONTCHANGE,
                                            [IntPtr]::Zero,
                                            [IntPtr]::Zero)
    }
}

# --- Call function with script arguments ---
if ($args.Count -eq 0) {
    Write-Error "Usage: .\Install-SysFont.ps1 <FontPath1> [<FontPath2> ...]"
    exit 1
}

Install-SysFont -FontPath $args
