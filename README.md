# OpenBSD Ansible Playbooks

Sets up my openbsd system using ansible to automate the process.

Tested on:

`openbsd 7.3 -current`

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

## Run the following commands to install the certain parts of the configuration:

#### Install my packages

- `make packages`

###### Packages that are installed:

- vim--no_x11
- curl
- wget
- firefox
- git
- cmus
- ranger
- cmixer
- obsdfreqd
- unzip--
- rsync--
- dina-fonts
- picom
- profanity
- newsboat
- mpv
- yt-dlp

#### Install my .config configuration files

- `make config`

#### Install my .local configuration files

- `make local`

#### Install my cwm configuration files

- `make cwm`

#### Install misc / rc configuration files

- `make rc`

#### Or to install everything simply run:

- `make`

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

## Ansible Configuration

This setup includes several improvements for better maintainability and reliability:

### Playbook Structure
- **site.yaml** - Main playbook that imports all others
- **xdg.yaml** - Sets up XDG Base Directory structure
- **packages.yaml** - Installs system packages
- **rc.yaml** - Configures system services and settings
- **local.yaml** - Sets up local user files and scripts
- **cwm.yaml** - Configures window manager
- **config.yaml** - Sets up user configuration files

### Key Features
- **Proper privilege escalation** - All playbooks use `become: true` with doas
- **Error handling** - Service management tasks won't fail the entire playbook
- **Idempotent operations** - Safe to run multiple times
- **Tagged execution** - Run specific components using tags
- **Consistent configuration** - ansible.cfg provides uniform settings

### Configuration Files
- **ansible.cfg** - Global Ansible configuration with performance optimizations
- **site.yaml** - Main playbook with tagged imports for selective execution

## XDG Base Directory Compliance

This setup follows XDG Base Directory specifications to keep the home directory clean:

### Directory Structure
```
~/.config/          # Configuration files
├── X11/            # X11 configuration (Xresources)
├── cwm/            # Window manager configuration
├── ksh/            # Shell configuration
├── git/            # Git configuration
├── ssh/            # SSH configuration
├── gtk-2.0/        # GTK2 configuration
├── gtk-3.0/        # GTK3 configuration
├── newsboat/       # RSS reader configuration
└── environment     # XDG environment variables

~/.local/           # User data
├── bin/            # User executables
└── share/          # Shared data
    ├── applications/
    ├── icons/
    ├── fonts/
    ├── themes/
    ├── desktop-directories/
    ├── gnupg/
    ├── pki/
    └── mime/
```

### Benefits
- **Clean home directory** - No dotfiles cluttering ~/
- **Standard compliance** - Follows XDG Base Directory spec
- **Better organization** - Logical grouping of files
- **Easier maintenance** - Clear separation of concerns
- **Portable** - Works across different systems and applications

## Usage Examples

### First-time setup
```bash
# Install dependencies
make deps

# Run everything
make all
```

### Selective installation
```bash
# Only install packages and system config
make system-only

# Only install user files
make user-only

# Just install packages
make packages
```

### Safe testing
```bash
# Check syntax before running
make check

# See what would change without making changes
make dry-run
```

### Maintenance
```bash
# Clean up temporary files
make clean

# Get help
make help
```
