#
# ~/.profile
#

unset LC_ALL

export LANG=en_US.UTF-8 \
       EDITOR="$(which vim)" \
       PATH="$PATH:/usr/local/sbin:/usr/sbin:/sbin:$HOME/.local/bin:/usr/games" \
       VISUAL="$(which vim)" \
       GREP_COLORS="mt=38;5;214:sl=:cx=:fn=38;5;236:ln=32:bn=32:se=38;5;233" \
       GREP_COLOR="38;5;214" \
       MANWIDTH=60

# 256 color ANSI sequences https://en.wikipedia.org/wiki/ANSI_escape_code
export LESS_TERMCAP_mb=$'\e[38;5;24m' \
       LESS_TERMCAP_md=$'\e[01;38;5;28m' \
       LESS_TERMCAP_so=$'\e[38;5;23m' \
       LESS_TERMCAP_us=$'\e[04;38;5;34m' \
       LESS_TERMCAP_ue=$'\e[0m' \
       LESS_TERMCAP_me=$'\e[0m' \
       LESS_TERMCAP_se=$'\e[0m' \
       LESSCHARSET=utf-8 \
       LESS="-j.5 -R"

if [[ "$TERM" != "screen-256color" ]]; then
    export TERM=screen-256color
fi

# Persist ssh-agent
if [[ -z "$SSH_AUTH_SOCK" ]]; then
    if [[ ! -e "$HOME/.ssh/ssh_agent" ]]; then
        eval "$(ssh-agent)"
        ln -s $SSH_AUTH_SOCK $HOME/.ssh/ssh_agent
    else
        export SSH_AUTH_SOCK="$HOME/.ssh/ssh_agent"
    fi
fi

for file in $(find $HOME/.profile.d -name '*.sh')
do
    source $file
done
