appendpath() {
	path="$1" ; list="$2" ; conf="$3"
	test -n "$list" || list=PATH

    # fucking shit hack
    # https://www.google.com/search?q=posix+shell+indirect+expansion
    expanded=$(eval echo -n \$$list)

	case ":$expanded:" in
	  *:"$path":*)
		;;
	  *)
		if test -z "$expanded"; then
			export $list="$path"
		elif test "$conf" == "APPEND"; then
			export $list="$expanded:$path"
		else
			export $list="$path:$expanded"
		fi
	esac
}

# ===================================================================

test -n "$TMPDIR" || export TMPDIR=/tmp

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

export XAUTHORITY=$HOME/.Xauthority

export GNUPGHOME=$HOME/.gnupg

appendpath "$HOME/.local/bin"
appendpath "$HOME/.local/lib"     LIBRARY_PATH
appendpath "$HOME/.local/lib"     LD_LIBRARY_PATH
appendpath "$HOME/.local/include" C_INCLUDE_PATH
appendpath "$HOME/.local/include" CPLUS_INCLUDE_PATH

# ===================================================================

export GTK_MODULES=
export _Z_DATA=$XDG_DATA_HOME/z

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

export MAKEFLAGS='-j8 --no-print-directory'

# ===================================================================

export TERMINAL=konsole
export LAUNCHER=krunner
export BROWSER=firefox

export GTK_USE_PORTAL=1
export MOZ_USE_XINPUT2=0
export RANGER_LOAD_DEFAULT_RC=FALSE

export SSH_ASKPASS=/usr/bin/ksshaskpass
export GIT_ASKPASS=/usr/bin/ksshaskpass
export GIT_SSH=/usr/bin/ssh
