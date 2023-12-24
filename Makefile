.PHONY: *
all: privileged

deps:
	@echo "Install dependencies?"
	@doas pkg_add ansible

packages:
	@echo "Run packages playbook?"
	@doas ansible-playbook packages.yaml

cwm:
	@echo "Run cwm playbook?"
	@doas ansible-playbook cwm.yaml

rc:
	@echo "Run rc playbook?"
	@doas ansible-playbook rc.yaml

local:
	@echo "Run local playbook?"
	@doas ansible-playbook local.yaml

config:
	@ansible-playbook config.yaml

privileged:
	@echo "Run all playbooks? (local, cwm, rc and config)"
	@doas ansible-playbook packages.yaml local.yaml cwm.yaml rc.yaml config.yaml
