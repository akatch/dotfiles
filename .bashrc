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
if [[ -e  ~/.aliases ]]; then
    source ~/.aliases
fi

# source profile
if [[ -e ~/.profile ]]; then
    source ~/.profile
fi

normal="\[\e[00m\]"
dark_gray="\[\e[38;05;237m\]"
green="\[\e[38;05;28m\]"
yellow="\[\e[38;05;208m\]"

export PS1="$green\h $dark_gray\w $green\$(git symbolic-ref --short HEAD 2> /dev/null) $dark_gray\$$normal "

eval "$(direnv hook bash)"
#. ~/.utf8
