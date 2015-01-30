#
# ~/.zshrc
#

HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=10000
setopt appendhistory autocd extendedglob notify
unsetopt beep nomatch
bindkey -v
zstyle :compinstall filename '${HOME}/.zshrc'
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

if [ -e /etc/profile.d/default.sh ]; then
    source /etc/profile.d/default.sh
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
alias nocomment='grep -Ev '\''^(#|$)'\'''
alias e='vim -p '
alias se='sudo -E vim -p '

# ssh
#alias ssh='TERM=xterm-color ssh'

# apt
alias acs="apt-cache search"
alias acp="apt-cache policy"
alias acsh="apt-cache show"
alias agi="apt-get install"
alias aga="apt-get autoremove"

# ansible

alias am='ansible-doc -s '
# [create|decrypt|edit|encrypt|rekey]
alias av-create='ansible-vault create '
alias av-decrypt='ansible-vault decrypt '
alias av-edit='ansible-vault edit '
alias av-encrypt='ansible-vault encrypt '
alias av-rekey='ansible-vault rekey '

# create a SHA256 hash
createPasswordHash() {
    python -c 'from passlib.hash import sha256_crypt; print sha256_crypt.encrypt("$1")'
}
alias genhash=createPasswordHash

# summon ansible facts
ansibleSetup() {
    ansible $1 -m setup > /etc/ansible/facts.d/$1.facts
}
alias accio=ansibleSetup

# search for processes and keep column headings
processSearch() {
    ps aux | egrep "$1|PID"
}
alias psgrep=processSearch

# sync music to Sansa Clip Zip
alias musync='rsync -az --no-perms --delete --delete-excluded --exclude=".tor*" --exclude="_tor*" /vault/music/ /media/${USER}/0123-4567/MUSIC'

alias rdesktop='rdesktop -g 1400x900'

# new hyde post
newPost() {
    vim ~/hyde/_posts/`date +%F`-$1.md
}
alias newpost=newPost

# grepfi
grepVi() {
    vim `grep -Hni <pattern> <file> | awk -F ":" '{print $1 " +" $2}' | head -n 1`
}
alias grepvi=grepVi

# mutt
alias ogmail='mutt -f imaps://a.n.katch@gmail.com@imap.gmail.com:993/'
alias wiscmail='mutt -f imaps://wiscmail.wisc.edu'
alias oopmbx='mutt -f imap://akatch@openmailbox.org@imap.openmailbox.org:143/'
alias opmbx='mutt -f imap://alex.bowles@openmailbox.org@imap.openmailbox.org:143/'
alias gmail='mutt -f imaps://bowlesalx@gmail.com@imap.gmail.com:993/'

# subliminal
alias sub='subliminal -l en --providers addic7ed opensubtitles tvsubtitles thesubdb -- '

# environment variables
export STEAMLIBS=${HOME}/steam-beta/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${STEAMLIBS}
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
export ANSIBLE_CONFIG=${HOME}/.ansible.cfg
export PATH="$PATH:${HOME}/bin:/opt/cisco/anyconnect/bin:${HOME}/bin/packer"

# UTF8
export LANG=en_US.UTF-8
export LESSCHARSET=utf-8
export PERL_UTF8_LOCALE=1 PERL_UNICODE=AS
export LC_ALL=en_US.UTF-8

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

normal="%{[0;0m%}"

# prompt
PROMPT="${bgreen}┌─${green}%M ${bgreen}[${green}%d${bgreen}]${bgreen}─>
${bgreen}└>${normal} "
RPROMPT="%(?..${bgreen}[${red}%?${bgreen}]${normal})"
PS2="${bgreen}└>${normal} "
