install:
	ansible-playbook ./playbook.yml --ask-become-pass --vault-password-file ~/.vault_password

