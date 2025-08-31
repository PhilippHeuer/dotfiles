# Windows Ansible Playbook

## Inventory

> Example inventory file for Windows hosts using PowerShell Remote Management

Transport Type: one of [credssp, basic, ntlm, kerberos]

```ini
[windows]
winhost ansible_host=127.0.0.1

[windows:vars]
ansible_user=LocalAccountName
ansible_password=LocalAccountPassword
ansible_connection=winrm
ansible_port=5986
ansible_winrm_transport=basic
ansible_winrm_server_cert_validation=ignore
```

## Test Connection

```
ansible windows -i inventory.ini -m win_ping
```

## Run Playbook

```
ansible-playbook -i inventory.ini playbook.yml
```
