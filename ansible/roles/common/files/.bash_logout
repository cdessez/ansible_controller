# Credits to fishilico, downloaded from https://github.com/fishilico/home-files/blob/master/dotfiles/bash_logout

# ~/.bash_logout: executed by bash(1) when login shell exits.

# when leaving the console clear the screen to increase privacy

if [ "$SHLVL" = 1 ]; then
    if [ -x /usr/bin/clear_console ]; then
        /usr/bin/clear_console -q
    elif [ -x /usr/bin/clear ]; then
        /usr/bin/clear
    elif [ -x /usr/bin/tput ]; then
        /usr/bin/tput clear
    fi
fi