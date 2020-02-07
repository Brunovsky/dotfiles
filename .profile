[[ -z $TMPDIR ]] && export TMPDIR=/tmp

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

export XAUTHORITY=$HOME/.Xauthority

export SSH_ASKPASS=/usr/bin/ksshaskpass
export GIT_ASKPASS=/usr/bin/ksshaskpass
export GIT_SSH=/usr/bin/ssh

# ===================================================================

# dump all editors here for future reference
export EDITOR=nano
export VISUAL=nano
export SUDO_EDITOR=nano
export MOST_EDITOR=nano
export PSQL_EDITOR=nano
export GIT_EDITOR=nano
export GIT_SEQUENCE_EDITOR=nano

# dump all pagers here for future reference
export PAGER=less
export MANPAGER=most
export PSQL_PAGER=most

export LESSHISTFILE=$HOME/.less_history
export LESS='-iJKRFx4 -P ?f%f .?ltline %lt?L/%L .. ?pB[%pB\%] . (h=help,q=quit) $'
export MANLESS='MAN \$MAN_PN  ?ltline %lt?L/%L .. ?pB[%pB\%] . (h=help,q=quit) '

export MOST_SWITCHES=-swt4
export MOST_INITFILE=$XDG_CONFIG_HOME/most/mostrc

# ===================================================================

export TERMINAL=konsole
export LAUNCHER=krunner
export BROWSER=firefox

export GTK_USE_PORTAL=1
export MOZ_USE_XINPUT2=0
