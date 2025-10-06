# OpenBSD Ansible Playbooks

Sets up my openbsd system using ansible to automate the process.

Tested on:

`openbsd 7.7 -current`

## Dependencies

- `doas`
- `ansible`
- `git`

##### My setup:

Window manager:
- [cwm](https://man.openbsd.org/cwm.1)

Terminal:
- [xterm](https://man.openbsd.org/xterm)

Status bar:
- Custom scripts (date-bar, desktop-id) - see bin/ directory

Icon theme:
- Adwaita

GTK theme:
- Adwaita

## Quick Start

```bash
# Install dependencies
make deps

# Run everything
make all
```

## Packages Installed

- vim--no_x11, curl, wget, firefox, git
- cmus, ranger, cmixer, obsdfreqd
- unzip--, rsync--, dina-fonts, picom
- profanity, newsboat, mpv, yt-dlp

## Available Make Targets

### Main Targets
- `make all` or `make` - Run all playbooks (same as `make privileged`)
- `make privileged` - Run all playbooks with system privileges

### Individual Components
- `make xdg` - Set up XDG Base Directory structure
- `make packages` - Install packages only
- `make config` - Install user configuration files only
- `make local` - Install local files and scripts only
- `make cwm` - Install window manager configuration only
- `make rc` - Install system configuration only

### Convenience Targets
- `make user-only` - Run user-related playbooks (xdg, config, local, cwm)
- `make system-only` - Run system-related playbooks (packages, rc)

### Utility Targets
- `make check` - Check playbook syntax without running
- `make dry-run` - Run in check mode to see what would change
- `make clean` - Clean up temporary files
- `make help` - Show all available targets
- `make deps` - Install ansible dependency
