# man bash /'Shell Variables' /ALIASES /PROMPTING

# --- ideas
# https://github.com/awesome-lists/awesome-bash
# https://github.com/mrzool/bash-sensible

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# system options
# ==============

# source shell files
[[ ! -f ~/.profile ]] || . ~/.profile
[[ ! -f ~/.dir_colors ]] || eval "$(dircolors ~/.dir_colors)"

# prompt
# ======

PS1='\n'
PS1+='\[\033[34m\]'     # blue
PS1+='\w'
PS1+='\[\033[0m\]'      # reset
PS1+='\n'
PS1+='\[\033[1;35m\]'   # bold purple
PS1+='❯'
PS1+='\[\033[0m\]'      # reset
PS1+=' '

# bash options
# ============

# history
HISTCONTROL=ignoreboth
HISTFILE="$HOME/.bash_history"
HISTSIZE=150000
HISTTIMEFORMAT='%F %T  '
HISTIGNORE='clear:reset:exit:ls'

# add commands to history immediately
PROMPT_COMMAND='history -a;history -n'

# see 'man bash' and 'shopt -p'
shopt -s cdspell
shopt -s checkjobs
shopt -s checkwinsize
shopt -s cmdhist
shopt -s dirspell
shopt -s dotglob
shopt -s extglob
shopt -s failglob
shopt -s globstar
shopt -s histappend
shopt -s hostcomplete
shopt -u lithist
shopt -s no_empty_cmd_completion

# incremental history search
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'

[[ -f ~/.aliases ]] && . ~/.aliases

# yield to better shell

if [[ $SHLVL -eq 1 && -z $BASH_YIELDED && $YIELD_TO_FISH -eq 1 ]]; then
    export BASH_YIELDED=1 && exec fish
elif [[ $SHLVL -eq 1 && -z $BASH_YIELDED && $YIELD_TO_ZSH -eq 1 ]]; then
    export BASH_YIELDED=1 && exec zsh
fi
