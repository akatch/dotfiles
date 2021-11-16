#
# ~/.zshrc
#

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd extendedglob notify
unsetopt beep nomatch
zstyle :compinstall filename '${HOME}/.zshrc'
autoload -Uz compinit
compinit

### from https://github.com/graysky2/configs/blob/master/dotfiles/.zshrc
setopt hist_expire_dups_first
setopt hist_ignore_space
setopt inc_append_history
setopt share_history

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '\eOA' up-line-or-beginning-search
bindkey '\e[A' up-line-or-beginning-search
bindkey '\eOB' down-line-or-beginning-search
bindkey '\e[B' down-line-or-beginning-search
### end stuff from graysky2

# fix home, end, del keys
bindkey '^[[1~' beginning-of-line
bindkey '^[[4~' end-of-line
bindkey '^[[3~' delete-char

# source aliases
if [[ -e  ~/.aliases ]]; then
    source ~/.aliases
fi

# source profile
if [[ -e ~/.profile ]]; then
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

# prompt
# TODO display git diff --shortstat
precmd() {
    vcs_info
    git_branch=${vcs_info_msg_0_}

    if [[ "$git_branch" == "" ]]; then
        export PS1="%F{%(?.28.208)}%m%f %F{237}%~%f %F{237}>%f "
    else
        export PS1="%F{%(?.28.208)}%m%f %F{237}%~%F{%(?.28.208)} ${git_branch} %F{237}>%f "
    fi
}
export PS2="   %F{236}>%f "
