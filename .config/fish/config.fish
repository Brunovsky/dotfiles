# man fish fish_config fish_prompt

# --- framework
# https://github.com/oh-my-fish/oh-my-fish

# general ls aliases
# ==================
# port of .aliases for the most part
# kept in sync with it

# ls=short, ll=long
# v=not dotfiles, .=dotfiles | f=files, d=dirs, l=link, s=socket

alias ll  "command ls --si --color=auto -bF --group-directories-first -lvA"
alias ls  "command ls --si --color=auto -bF --group-directories-first -CvA"
alias llv "command ls --si --color=auto -bF --group-directories-first -lv"
alias lsv "command ls --si --color=auto -bF --group-directories-first -Cv"
alias ll. "command ls --si --color=auto -bF --group-directories-first -lvA --ignore '[!.]*'"
alias ls. "command ls --si --color=auto -bF --group-directories-first -CvA --ignore '[!.]*'"

function llf  --description 'list files' --wraps ls
    ll  --color=always $argv | grep -Eve '^d([r-][w-][xst-])+ '
end
function llfv --description 'list visible files' --wraps ls
    llv --color=always $argv | grep -Eve '^d([r-][w-][xst-])+ '
end
function llf. --description 'list hidden files' --wraps ls
    ll. --color=always $argv | grep -Eve '^d([r-][w-][xst-])+ '
end
function lld  --description 'list folders' --wraps ls
    ll  --color=always $argv | grep -Eve '^[^d]([r-][w-][xst-])+ '
end
function lldv --description 'list visible folders' --wraps ls
    llv --color=always $argv | grep -Eve '^[^d]([r-][w-][xst-])+ '
end
function lld. --description 'list hidden folders' --wraps ls
    ll. --color=always $argv | grep -Eve '^[^d]([r-][w-][xst-])+ '
end
function lll  --description 'list symlinks' --wraps ls
    ll  --color=always $argv | grep -Eve '^[^l]([r-][w-][xst-])+ '
end
function lllv --description 'list visible symlinks' --wraps ls
    llv --color=always $argv | grep -Eve '^[^l]([r-][w-][xst-])+ '
end
function lll. --description 'list hidden symlinks' --wraps ls
    ll. --color=always $argv | grep -Eve '^[^l]([r-][w-][xst-])+ '
end
function lls  --description 'list sockets' --wraps ls
    ll  --color=always $argv | grep -Eve '^[^s]([r-][w-][xst-])+ '
end
function llsv --description 'list visible sockets' --wraps ls
    llv --color=always $argv | grep -Eve '^[^s]([r-][w-][xst-])+ '
end
function lls. --description 'list hidden sockets' --wraps ls
    ll. --color=always $argv | grep -Eve '^[^s]([r-][w-][xst-])+ '
end

# carefully copy, move, rename, remove and link files
# ===================================================

alias carecp 'cp --interactive --verbose --preserve=links --no-dereference'
alias caremv 'mv --interactive --verbose'
alias carerename 'rename --no-overwrite --verbose'
alias carerm 'rm --interactive --dir --verbose'
alias careln 'ln --interactive --verbose'

# I can't seem to remember this
alias lnorder 'echo -e "ln [option]... [-s] [-T] SINK SOURCE (SOURCE->SINK)\n
    -s for symbolic, -T to treat SINK as a normal file"'

alias mkdir 'mkdir --parents --verbose'
alias rmdir 'rmdir --verbose'

alias rsynccp 'rsync -ae ssh -vh --progress'
alias rsynctransfer 'rsync -ae ssh -vh --info=progress2 --no-inc-recursive'

function mkcd --description 'mkdir followed by cd' --wraps cd
	mkdir $argv[1] && cd $argv[1]
end

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

alias df 'df --si'
alias du 'du --si -cs'
alias tree 'tree --si -F --dirsfirst -vas -L 3 --filelimit 1000'
alias bc 'bc --interactive --mathlib'
alias ffmpeg 'ffmpeg -hide_banner'

alias yield_bash 'export BASH_NOYIELD=1'

# split a path aggregator
alias splitcolon 'tr -s " " "\n"'
alias path 'echo $PATH | splitcolon'

# invoke valgrind to debug memory leaks
alias memcheck 'valgrind --leak-check=full --show-leak-kinds=all'

# source code grep
alias sgrep 'grep -HnE'
alias sigrep 'grep -HniE'

# dotfiles
alias dotf 'git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# pretty print json
alias prettyjson='python -m json.tool'

# copy to clipboard
alias clipclip 'xclip -selection clipboard'

# grep man pages
alias mangrep 'man -KI --regex'
alias manigrep 'man -Ki --regex'
