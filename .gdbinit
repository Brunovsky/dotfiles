# man gdb gdbinit

# --- examples
# https://github.com/RAttab/dotfiles/blob/master/.gdbinit
# https://git.connectical.com/aperez/dotfiles/src/master/dot.gdbinit
# https://github.com/s3rvac/dotfiles/blob/master/gdb/.gdbinit

set confirm off
set verbose off

set history save on
set history size 16000
set history filename ~/.gdb_history

set print pretty on
set print demangle on
set print asm-demangle on
set print object on
set print static-members off

tui enable
layout src
fs src

alias -a rf = refresh
