#
# ~/.profile
#

unset LC_ALL

export LANG=en_US.UTF-8 \
       EDITOR="$(which vim)" \
       PATH="$HOME/.local/bin:/bin:/usr/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin:/usr/games" \
       VISUAL="$(which vim)" \
       GPG_TTY=$(tty) \
       GREP_COLORS="mt=38;5;214:sl=:cx=:fn=38;5;236:ln=32:bn=32:se=38;5;233" \
       GREP_COLOR="38;5;214" \
       JQ_COLORS="1;30:0;37:0;37:0;37:0;32:1;37:1;37" \
       MANWIDTH=60 \
       MANROFFOPT="-c" \
       QUOTING_STYLE=literal

# 256 color ANSI sequences https://en.wikipedia.org/wiki/ANSI_escape_code
export LESS_TERMCAP_mb=$'\e[38;5;24m' \
       LESS_TERMCAP_md=$'\e[01;38;5;28m' \
       LESS_TERMCAP_so=$'\e[38;5;214m' \
       LESS_TERMCAP_us=$'\e[04;38;5;34m' \
       LESS_TERMCAP_ue=$'\e[0m' \
       LESS_TERMCAP_me=$'\e[0m' \
       LESS_TERMCAP_se=$'\e[0m' \
       LESSCHARSET=utf-8 \
       LESS="-j.5 -R -F -X"

if [[ "$TERM" != "screen-256color" ]]; then
    export TERM=screen-256color
fi

# Persist ssh-agent
if [[ -z "$SSH_AUTH_SOCK" ]]; then
    # TODO verify the process is still alive....
    if [[ -L "$HOME/.ssh/ssh_agent" && -e "$HOME/.ssh/ssh_agent" ]]; then
        # found ssh_auth_sock, use it
        export SSH_AUTH_SOCK="$HOME/.ssh/ssh_agent"
    else
        # didn't find ssh_auth_sock, start ssh-agent
        eval "$(ssh-agent)"
        ln -sf "$SSH_AUTH_SOCK" "$HOME/.ssh/ssh_agent"
    fi
fi

if [[ -d $HOME/.profile.d ]]; then
    for file in $(find "$HOME/.profile.d/" -name "*.sh"); do
        source $file
    done
fi
