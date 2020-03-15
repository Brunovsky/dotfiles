test -f ~/.profile && . ~/.profile

if test -n "$DESKTOP_SESSION"; then
    eval "$(gnome-keyring-daemon --start)"
    export SSH_AUTH_SOCK
fi
