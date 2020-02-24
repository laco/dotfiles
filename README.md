# dotfiles

My development environment setup in Ansible playbooks

## Requirements

- Ubuntu 18.04 LTS
- A user account with sudo (`laco`)
- ansible-vault password stored in ~/.personal_vault_password

## Install Ansible on Ubuntu

```
sudo apt update
sudo apt install python3-pip
pip3 install --user ansible
export PATH=~/.local/bin:$PATH
```

## Main usage:

```
make install
```

## To install just a specific role:

```
TAGS=fish make install-only
```