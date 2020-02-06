# .profile

[[ -z $TMPDIR ]] && export TMPDIR=/tmp

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

export XAUTHORITY=$HOME/.Xauthority

export EDITOR=nano
export VISUAL=nano
export SUDO_EDITOR=nano
export MOST_EDITOR=nano
export PSQL_EDITOR=nano

export PAGER=less
export GIT_PAGER=less
export MANPAGER=most
export PSQL_PAGER=most

export MOST_SWITCHES=-swt4
export MOST_INITFILE=$XDG_CONFIG_HOME/most/mostrc

export LESSHISTFILE=$HOME/.less_history
export LESS='-iJKRFx4 -P ?f%f .?ltline %lt?L/%L .. ?pB[%pB\%] . (h=help,q=quit) $'
export MANLESS='MAN \$MAN_PN  ?ltline %lt?L/%L .. ?pB[%pB\%] . (h=help,q=quit) '

export BROWSER=firefox
export TERMINAL=konsole

export GTK_USE_PORTAL=1
export MOZ_USE_XINPUT2=0
export KDEWM=i3

export SSH_ASKPASS=/usr/bin/ksshaskpass
export GIT_ASKPASS=/usr/bin/ksshaskpass
