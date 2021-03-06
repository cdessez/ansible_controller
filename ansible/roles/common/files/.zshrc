# Credits to fishilico, downloaded from https://github.com/fishilico/home-files/blob/master/dotfiles/zshrc

# Find best configuration dir
SHELL_CONFIG_DIR=""
# Try $0 if the file has been directly source'd
if [ "${0##*/}" = ".zshrc" ] && [ -d "${0%.zshrc}.shell" ] ; then
    SHELL_CONFIG_DIR="${0%.zshrc}.shell"
elif [ "${0##*/}" = "zshrc" ] && [ -d "${0%zshrc}shell" ] ; then
    SHELL_CONFIG_DIR="${0%zshrc}shell"
elif [ -n "$SUDO_USER" ] ; then
    SUDO_HOME=$(getent passwd "$SUDO_USER" | cut -d: -f6)
    SHELL_CONFIG_DIR="$SUDO_HOME/.shell"
    unset SUDO_HOME
fi
# Fallback to home directory
if [ -z "$SHELL_CONFIG_DIR" ] || [ ! -d "$SHELL_CONFIG_DIR" ] ; then
    SHELL_CONFIG_DIR="$HOME/.shell"
fi
# Source configuration files
for FILE in aliases environment functions prompt zshbindings zshcompletion 'local' ; do
    if [ -f "$SHELL_CONFIG_DIR/$FILE" ]; then
        # shellcheck source=/dev/null
        . "$SHELL_CONFIG_DIR/$FILE"
    fi
done
unset SHELL_CONFIG_DIR FILE

# Keep 10000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
# shellcheck disable=SC2034
SAVEHIST=10000
HISTFILE=$HOME/.zsh_history
setopt appendhistory autocd beep extendedglob nomatch notify
setopt INC_APPEND_HISTORY # append each session history to common one
setopt SHARE_HISTORY # share history between all sessions
setopt HIST_IGNORE_ALL_DUPS # remove dups
setopt HIST_SAVE_NO_DUPS # don't save duplicate entries
setopt HIST_FIND_NO_DUPS # don't show dups when scrolling history
setopt HIST_REDUCE_BLANKS # remove useless space in stored commands
setopt HIST_IGNORE_SPACE # don't store lines beginning with space

# Protection against rm *
setopt NORM_STAR_SILENT

# Show time for lengthy programs
export REPORTTIME='10'

# chdir if typed name is a dir name, e.g ".."
setopt AUTO_CD
