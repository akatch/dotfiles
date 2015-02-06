#
# ~/.bashrc
#

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b ~/.dircolors`"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

# source aliases
if [ -e  ~/.aliases ]; then
    source ~/.aliases
fi

case "$TERM" in
    rxvt-unicode-256color)
        TERM=xterm-color
        ;;
esac

#
# Environment variables
#

black="\[\e[00;30m\]"
red="\[\e[00;31m\]"
green="\[\e[00;32m\]"
yellow="\[\e[00;33m\]"
blue="\[\e[00;34m\]"
magenta="\[\e[00;35m\]"
cyan="\[\e[00;36m\]"
white="\[\e[00;37m\]"
gray="\[\e[00;38m\]"

b_black="\[\e[1;30m\]"
b_red="\[\e[1;31m\]"
b_green="\[\e[1;32m\]"
b_yellow="\[\e[1;33m\]"
b_blue="\[\e[1;34m\]"
b_magenta="\[\e[1;35m\]"
b_cyan="\[\e[1;36m\]"
b_white="\[\e[1;37m\]"
b_gray="\[\e[1;38m\]"

normal="\[\e[00m\]"

export PS1="$b_green> $green\h $b_green[$green\w$b_green] >\n> $normal"
export RPROMPT="${b_green}[${red}\${?##0}${bgreen}]"
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
export PATH=$PATH:/opt/cisco/anyconnect/bin

#. ~/.utf8
