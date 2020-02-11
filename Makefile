install:
	ansible-playbook ./playbook.yml --ask-become-pass --vault-password-file ~/.personal_vault_password

install-only:
	ansible-playbook ./playbook.yml --ask-become-pass --vault-password-file ~/.personal_vault_password --tags $(TAGS)
