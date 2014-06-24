#
# ~/.zshrc
#

HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=10000
setopt appendhistory autocd extendedglob notify
unsetopt beep nomatch
bindkey -v
zstyle :compinstall filename '/home/ally/.zshrc'
autoload -Uz compinit
compinit

### from https://github.com/graysky2/configs/blob/master/dotfiles/.zshrc
setopt hist_expire_dups_first
setopt hist_ignore_space
setopt inc_append_history
setopt share_history

# fix zsh annoying history behavior
h() { if [ -z "$*" ]; then history 1; else history 1 | egrep "$@"; fi; }

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '\eOA' up-line-or-beginning-search
bindkey '\e[A' up-line-or-beginning-search
bindkey '\eOB' down-line-or-beginning-search
bindkey '\e[B' down-line-or-beginning-search
### end stuff from graysky2

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b ~/.dircolors`"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

# Alias definitions

# general stuff
alias sudo='sudo '
alias norsk='setxkbmap no'
alias eng='setxkbmap us'
alias 3cal='cal -3'
alias isomount='sudo mount -o loop,exec'
alias ll='ls -lh'
alias la='ls -A'
alias l='ls -CF'
alias lah='ls -lah'
alias usg='du -h --max-depth=1 -x'
alias z='source ~/.zshrc'

# ssh
alias ssh='TERM=xterm-color ssh'

# apt
alias acs="apt-cache search"
alias acp="apt-cache policy"
alias acsh="apt-cache show"
alias agi="apt-get install"
alias aga="apt-get autoremove"

# ansible
# [create|decrypt|edit|encrypt|rekey]
alias av-create='ansible-vault create --vault-password-file=/home/ally/.ansible/vault '
#alias av-decrypt='ansible-vault decrypt --vault-password-file=/home/ally/.ansible/vault '
alias av-edit='ansible-vault edit --vault-password-file=/home/ally/.ansible/vault '
alias av-encrypt='ansible-vault encrypt --vault-password-file=/home/ally/.ansible/vault '
alias av-rekey='ansible-vault rekey --vault-password-file=/home/ally/.ansible/vault '
alias ansible-playbook='ansible-playbook --vault-password-file=/home/ally/.ansible/vault '
alias ansible='ansible --vault-password-file=/home/ally/.ansible/vault '

# create a SHA256 hash
createPasswordHash() {
    python -c 'from passlib.hash import sha256_crypt; print sha256_crypt.encrypt("$1")'
}
alias genhash=createPasswordHash

# summon ansible facts
ansibleSetup() {
    ansible $1 -m setup --vault-password-file=/home/ally/.ansible/vault > ~/$1.txt
}
alias accio=ansibleSetup

# search for processes and keep column headings
processSearch() {
    ps aux | egrep "$1|PID"
}
alias psgrep=processSearch

# sync music to Sansa Clip Zip
alias musync='rsync -az --no-perms --delete --delete-excluded --exclude=".tor*" --exclude="_tor*" /vault/music/ /media/ally/0123-4567/MUSIC'

alias rdesktop='rdesktop -g 1400x900'

export STEAMLIBS=${HOME}/steam-beta/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${STEAMLIBS}
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
export DISPLAY=:0
export ANSIBLE_CONFIG=/home/ally/.ansible.cfg
export PATH="$PATH:/home/ally/bin:/opt/cisco/anyconnect/bin:/home/ally/bin/packer"

# UTF8
export LANG=en_US.UTF-8
export LESSCHARSET=utf-8
export PERL_UTF8_LOCALE=1 PERL_UNICODE=AS

# fix ctrl-s
stty -ixon

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

# prompt
exit_code_prompt() {
  PROMPT="${bgreen}> ${green}%m ${bgreen}[${green}%d${bgreen}] %(?.${green}^_^.${red}-_-) ${bgreen}>
$bgreen> ${normal}"
  RPROMPT="%(?..${bgreen}[${red}%?${bgreen}] )${normal}"
}
exit_code_prompt
