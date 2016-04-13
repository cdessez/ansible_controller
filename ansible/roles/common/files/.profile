# Credits to fishilico, downloaded from https://github.com/fishilico/home-files/blob/master/dotfiles/profile

# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# This file is read by dash(1) when invoked as a login shell (-l option).
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        # shellcheck source=/dev/null
        . "$HOME/.bashrc"
    fi
elif [ -z "$ZSH_VERSION" ]; then
    # not bash nor zsh, maybe ash or dash?
    # find best configuration dir and include every configuration files
    SHELL_CONFIG_DIR=""
    # Try $0 if it contains the path which has been used to source the file
    if [ "${0##*/}" = ".profile" ] && [ -d "${0%.profile}.shell" ] ; then
        SHELL_CONFIG_DIR="${0%.profile}.shell"
    elif [ "${0##*/}" = "profile" ] && [ -d "${0%profile}shell" ] ; then
        SHELL_CONFIG_DIR="${0%profile}shell"
    elif [ -n "$SUDO_USER" ] ; then
        SUDO_HOME=$(getent passwd "$SUDO_USER" | cut -d: -f6)
        SHELL_CONFIG_DIR="$SUDO_HOME/.shell"
        unset SUDO_HOME
    else
        SHELL_CONFIG_DIR="$HOME/.shell"
    fi

    for FILE in aliases environment functions prompt 'local' ; do
        if [ -f "$SHELL_CONFIG_DIR/$FILE" ]; then
            # shellcheck source=/dev/null
            . "$SHELL_CONFIG_DIR/$FILE"
        fi
    done
    unset SHELL_CONFIG_DIR FILE
fi

# Disallow messages from others when running root
#if [ "$(id -u)" -eq 0 ]; then
#    mesg n
#fi