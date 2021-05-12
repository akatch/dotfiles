#
# ~/.bashrc
#

shopt -s autocd cmdhist histappend hostcomplete nocaseglob

# source aliases
if [ -e  ~/.aliases ]; then
    source ~/.aliases
fi

# source profile
if [ -e ~/.profile ]; then
    source ~/.profile
fi

normal="\[\e[00m\]"

dark_gray="\[\e[38;05;236m\]"
green="\[\e[38;05;28m\]"
yellow="\[\e[38;05;208m\]"

if [[ "$git_branch" == "" ]]; then
    export PS1=" $dark_gray\w
 $green\h $dark_gray>$normal "
else
    export PS1=" $dark_gray\w
 $green\h $dark_gray|$green $git_branch $dark_gray>$normal "
fi

export PS2="   $dark_gray>$normal "

eval "$(direnv hook bash)"
#. ~/.utf8
