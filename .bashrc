#
# ~/.bashrc
#

shopt -s autocd cmdhist histappend hostcomplete nocaseglob

# history search like zsh
bind '"\e[A": history-search-backward'
bind '"\eOA": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\eOB": history-search-forward'

# tabcomplete like zsh
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

# source aliases
if [[ -f  ~/.aliases ]]; then
    source ~/.aliases
fi

# source profile
if [[ -f ~/.profile ]]; then
    source ~/.profile
fi

if [[ -d $HOME/.local/share/bash-completion/completions ]]; then
    for file in $(find "$HOME/.local/share/bash-completion/completions/" -type f,l); do
        source $file
    done
fi

normal="\[\e[00m\]"
dark_gray="\[\e[38;05;237m\]"
bgreen="\[\e[38;05;64m\]"
yellow="\[\e[38;05;208m\]"

export PS1="$dark_gray\h $bgreen\w $dark_gray\$(git branch --show-current 2> /dev/null) $bgreen\$$normal "

#. ~/.utf8
