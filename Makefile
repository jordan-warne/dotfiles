.PHONY: all deps packages cwm rc local config xdg privileged user-only system-only

all: privileged

deps:
	@echo "Installing dependencies..."
	@doas pkg_add ansible

xdg:
	@echo "Setting up XDG Base Directory structure..."
	@doas ansible-playbook xdg.yaml

packages:
	@echo "Installing packages..."
	@doas ansible-playbook packages.yaml

cwm:
	@echo "Installing cwm configuration..."
	@doas ansible-playbook cwm.yaml

rc:
	@echo "Installing system configuration..."
	@doas ansible-playbook rc.yaml

local:
	@echo "Installing local configuration..."
	@doas ansible-playbook local.yaml

config:
	@echo "Installing user configuration..."
	@doas ansible-playbook config.yaml

privileged:
	@echo "Running all playbooks..."
	@doas ansible-playbook site.yaml

# Individual targets for better control
user-only: xdg config local cwm
system-only: packages rc

# Additional useful targets
check:
	@echo "Checking playbook syntax..."
	@ansible-playbook --syntax-check site.yaml

dry-run:
	@echo "Running in check mode..."
	@doas ansible-playbook --check site.yaml

clean:
	@echo "Cleaning up temporary files..."
	@rm -f /tmp/ansible.log

help:
	@echo "Available targets:"
	@echo "  all/privileged  - Run all playbooks"
	@echo "  deps           - Install ansible"
	@echo "  xdg            - Set up XDG Base Directory structure"
	@echo "  packages       - Install packages only"
	@echo "  config         - Install user config only"
	@echo "  local          - Install local files only"
	@echo "  cwm            - Install window manager config only"
	@echo "  rc             - Install system config only"
	@echo "  user-only      - Run user-related playbooks (xdg, config, local, cwm)"
	@echo "  system-only    - Run system-related playbooks (packages, rc)"
	@echo "  check          - Check playbook syntax"
	@echo "  dry-run        - Run in check mode"
	@echo "  clean          - Clean temporary files"
	@echo "  help           - Show this help"
