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
- none

Icon theme:
- Adwaita

GTK theme:
- Adwaita

## Run the following commands to install the certain parts of the configuration:

#### Install my packages

- `make packages`

###### Packages that are installed:

- vim
- curl
- wget
- chromium
- tor-browser
- git
- ranger
- cmixer
- obsdfreqd
- unzip
- rsync
- dina-fonts
- picom
- profanity
- keepassxc

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
