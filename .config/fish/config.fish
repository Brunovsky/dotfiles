# man fish fish_config fish_prompt

# --- framework
# https://github.com/oh-my-fish/oh-my-fish

ulimit -c 2097152

# general ls aliases
# ==================
# port of .aliases for the most part
# kept in sync with it

# ls=short, ll=long
# v=not dotfiles, .=dotfiles | f=files, d=dirs, l=link, s=socket

alias ll  "ls --si --color=auto -bF --group-directories-first -lvA"
alias ls  "ls --si --color=auto -bF --group-directories-first -CvA"
alias llv "ls --si --color=auto -bF --group-directories-first -lv"
alias lsv "ls --si --color=auto -bF --group-directories-first -Cv"
alias ll. "ls --si --color=auto -bF --group-directories-first -lvA --ignore '[!.]*'"
alias ls. "ls --si --color=auto -bF --group-directories-first -CvA --ignore '[!.]*'"

function llf  --description 'list files'
    ll  --color=always $argv | grep -Eve '^d([r-][w-][xst-])+ '
end
function llfv --description 'list visible files'
    llv --color=always $argv | grep -Eve '^d([r-][w-][xst-])+ '
end
function llf. --description 'list hidden files'
    ll. --color=always $argv | grep -Eve '^d([r-][w-][xst-])+ '
end
function lld  --description 'list folders'
    ll  --color=always $argv | grep -Eve '^[^d]([r-][w-][xst-])+ '
end
function lldv --description 'list visible folders'
    llv --color=always $argv | grep -Eve '^[^d]([r-][w-][xst-])+ '
end
function lld. --description 'list hidden folders'
    ll. --color=always $argv | grep -Eve '^[^d]([r-][w-][xst-])+ '
end
function lll  --description 'list symlinks'
    ll  --color=always $argv | grep -Eve '^[^l]([r-][w-][xst-])+ '
end
function lllv --description 'list visible symlinks'
    llv --color=always $argv | grep -Eve '^[^l]([r-][w-][xst-])+ '
end
function lll. --description 'list hidden symlinks'
    ll. --color=always $argv | grep -Eve '^[^l]([r-][w-][xst-])+ '
end
function lls  --description 'list sockets'
    ll  --color=always $argv | grep -Eve '^[^s]([r-][w-][xst-])+ '
end
function llsv --description 'list visible sockets'
    llv --color=always $argv | grep -Eve '^[^s]([r-][w-][xst-])+ '
end
function lls. --description 'list hidden sockets'
    ll. --color=always $argv | grep -Eve '^[^s]([r-][w-][xst-])+ '
end

# carefully copy, move, rename, remove and link files
# ===================================================

alias carecp 'cp --interactive --verbose --preserve=links --no-dereference'
alias caremv 'mv --interactive --verbose'
alias carerename 'rename --no-overwrite --verbose'
alias carerm 'rm --interactive --dir --verbose'
alias careln 'ln --interactive --verbose'

alias mkdir 'mkdir --parents --verbose'
alias rmdir 'rmdir --verbose'

# move around
# ===========

alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'
alias ...... 'cd ../../../../..'
alias .1 'cd ..'
alias .2 'cd ../..'
alias .3 'cd ../../..'
alias .4 'cd ../../../..'
alias .5 'cd ../../../../..'

# simple functions
# ================

alias path 'echo $PATH | tr -s " " "\n"'
alias df 'df --si'
alias du 'du --si -cs'
alias tree 'tree --si -F --dirsfirst -vas -L 3 --filelimit 1000'
alias bc 'bc --interactive --mathlib'
alias ffmpeg 'ffmpeg -hide_banner'

# invoke valgrind to debug memory leaks
alias memcheck 'valgrind --leak-check=full --show-leak-kinds=all'

# source code grep
alias sgrep 'grep -HnE'
alias sigrep 'grep -HniE'

# dotfiles
alias dotf 'git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# I can't seem to remember this
alias lnorder 'echo "ln [option]... [-s] [-T] SINK SOURCE (SOURCE->SINK)
    -s for symbolic, -T to treat SINK as a normal file"'

alias xorgdrivers='grep -e "Using input driver" $XDG_DATA_HOME/xorg/Xorg*log'
