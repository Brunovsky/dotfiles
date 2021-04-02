[[ -f ~/.profile ]] && source ~/.profile
[[ $- == *i* && -f ~/.bashrc ]] && source ~/.bashrc

if test -n "$DESKTOP_SESSION"; then
    eval "$(gnome-keyring-daemon --start)"
    export SSH_AUTH_SOCK
fi
