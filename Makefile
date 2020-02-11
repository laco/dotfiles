install:
	ansible-playbook ./playbook.yml --ask-become-pass --vault-password-file ~/.personal_vault_password

