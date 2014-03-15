# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob notify
unsetopt beep nomatch
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ally/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b ~/.dircolors`"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

#
# Alias definitions.
#

alias norsk='setxkbmap no'
alias eng='setxkbmap us'
alias 3cal='cal -3'
alias isomount='sudo mount -o loop,exec'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias lah='ls -lah'

# apt
alias acs="apt-cache search"
alias acp="apt-cache policy"
alias acsh="apt-cache show"
alias agi="apt-get install"

ansibleSetup() {
    ansible $1 -m setup > ~/$1.txt
}
alias accio=ansibleSetup

export STEAMLIBS=${HOME}/steam-beta/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${STEAMLIBS}
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
export DISPLAY=:0
export PATH="$PATH:/home/ally/bin:/opt/cisco/anyconnect/bin"

# UTF8
export LANG=en_US.UTF-8
export LESSCHARSET=utf-8
export PERL_UTF8_LOCALE=1 PERL_UNICODE=AS

# fix ctrl-s

# 
# Colors
#

# normal
black="%{[0;30m%}"
red="%{[0;31m%}"
green="%{[0;32m%}"
yellow="%{[0;33m%}"
blue="%{[0;34m%}"
magenta="%{[0;35m%}"
cyan="%{[0;36m%}"
white="%{[0;37m%}"

# bold (grey is actually bold black)
grey="%{[01;30m%}"
bred="%{[01;31m%}"
bgreen="%{[01;32m%}"
byellow="%{[01;33m%}"
bblue="%{[01;34m%}"
bmagenta="%{[01;35m%}"
bcyan="%{[01;36m%}"
bwhite="%{[01;37m%}"

# underscore
ublack="%{[04;30m%}"
ugrey="%{[01;04;30m%}"
ured="%{[04;31m%}"
ugreen="%{[04;32m%}"
uyellow="%{[04;33m%}"
ublue="%{[04;34m%}"
umagenta="%{[04;35m%}"
ucyan="%{[04;36m%}"
uwhite="%{[04;37m%}"

# blinking
kgrey="%{[01;05;30m%}"
kred="%{[05;31m%}"
kgreen="%{[05;32m%}"
kyellow="%{[05;33m%}"
kblue="%{[05;34m%}"
kmagenta="%{[05;35m%}"
kcyan="%{[05;36m%}"
kwhite="%{[05;37m%}"

normal="%{[0m%}"

exit_smiley() {
    # code for shiny exit code smiley here
}

exit_code_prompt() {
PROMPT="${bgreen}» ${green}%m ${bgreen}[${green}%d${bgreen}] %(?.${green}^_^.${red}-_-) ${bgreen}»
$bgreen» ${normal}"
RPROMPT="%(?..${bgreen}[${red}%?${bgreen}] )${normal}"
}
exit_code_prompt
