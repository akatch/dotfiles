#
# ~/.zshrc
#

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd extendedglob notify
unsetopt beep nomatch
zstyle :compinstall filename '${HOME}/.zshrc'
autoload -Uz compinit
compinit

### from https://github.com/graysky2/configs/blob/master/dotfiles/.zshrc
setopt hist_expire_dups_first
setopt hist_ignore_space
setopt inc_append_history
setopt share_history

# fix zsh annoying history behavior
h() {
    if [ -z "$*" ]; then
        history 1;
    else history 1 | egrep "$@";
    fi;
}

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '\eOA' up-line-or-beginning-search
bindkey '\e[A' up-line-or-beginning-search
bindkey '\eOB' down-line-or-beginning-search
bindkey '\e[B' down-line-or-beginning-search
### end stuff from graysky2

# enable color support
if [[ -x /usr/bin/dircolors && -e ~/.config/dircolors ]]; then
    eval "`dircolors -b ~/.config/dircolors`"
fi

# source aliases
if [ -e  ~/.aliases ]; then
    source ~/.aliases
fi

# source profile
if [ -e ~/.profile ]; then
    source ~/.profile
fi

# Git prompt
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
    '%F{2}%b %F{3}%a%f'
    #'%F{5}(%F{2}%s%F{5})%F{8}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       \
    '%b'
    #' %F{8}< %F{2}%b %F{8}>%f '
    #'%F{5}(%F{2}%s%F{5})%F{8}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

zstyle ':vcs_info:*' enable git

# or use precmd, see man zshcontrib


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
gray="%{[01;30m%}"
bred="%{[01;31m%}"
bgreen="%{[01;32m%}"
byellow="%{[01;33m%}"
bblue="%{[01;34m%}"
bmagenta="%{[01;35m%}"
bcyan="%{[01;36m%}"
bwhite="%{[01;37m%}"

normal="%{[0;0m%}"

# prompt
# TODO display git diff --shortstat
precmd() {
    vcs_info
    git_branch=${vcs_info_msg_0_}

    if [[ "$git_branch" == "" ]]; then
        export PS1="
 %(?.${green}.${yellow})%m ${gray}>%(?.${green}.${yellow})>${gray}>${normal} "
    else
        export PS1="
 %(?.${green}.${yellow})%m ${gray}|%(?.${green}.${yellow}) ${git_branch} ${gray}>%(?.${green}.${yellow})>${gray}>${normal} "
    fi
}
export PS2="   ${gray}>${normal} "

eval "$(direnv hook zsh)"
