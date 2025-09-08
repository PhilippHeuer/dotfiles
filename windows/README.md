# Windows Ansible Playbook

## WinRM Setup

To set up PowerShell Remoting on your Windows host use the provided script [winrm.ps1](winrm.ps1).
This script creates a firewall rule for access from trusted networks (Domain, Private).

## Inventory

> Example inventory file for Windows hosts using PowerShell Remote Management

Transport Type: one of [credssp, basic, ntlm, kerberos]

```ini
[windows]
winhost ansible_host=<your-ip>

[windows:vars]
ansible_user=LocalAccountName
ansible_password=LocalAccountPassword
ansible_connection=winrm
ansible_port=5986
ansible_winrm_transport=basic
ansible_winrm_server_cert_validation=ignore
```

```yaml
all:
  children:
    phx:
      hosts:
        desktop:
          ansible_host: <your-ip>
          # launcher
          app_flowlauncher: true
          # development
          app_vscode: true
          app_vscodium: true
          # fonts
          font_jetbrains: true
      vars:
        ansible_user: LocalAccountName
        ansible_password: LocalAccountPassword
        ansible_connection: winrm
        ansible_port: 5986
        ansible_winrm_transport: basic
        ansible_winrm_server_cert_validation: ignore

```

## Test Connection

```
ansible windows -i inventory.yaml -m win_ping
```

## Run Playbook

```
ansible-playbook -i inventory.yaml playbook.yml
```
