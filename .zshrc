# man 1 zsh zshmisc zshmodules zshoptions

# --- plugins and framework
# https://github.com/unixorn/awesome-zsh-plugins
# https://github.com/ohmyzsh/ohmyzsh
# https://github.com/romkatv/powerlevel10k
# --- prompt and modules
# https://gitlab.com/dwt1/dotfiles
# https://github.com/LukeSmithxyz/voidrice

[[ ! -f ~/.dir_colors ]] || eval "$(dircolors ~/.dir_colors)"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  . "$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# oh-my-zsh
# =========

export ZSH="$HOME/.oh-my-zsh"
export ZSH_CONFIG="$HOME/.config/zsh"
export ZSH_CUSTOM="$ZSH_CONFIG/custom"

DEFAULT_USER=$(whoami)

DISABLE_AUTO_UPDATE=false
DISABLE_UPDATE_PROMPT=true
export UPDATE_ZSH_DAYS=7

CASE_SENSITIVE=true
HYPHEN_INSENSITIVE=true
COMPLETION_WAITING_DOTS=false
HIST_STAMPS='%F %T'

ZSH_THEME=powerlevel10k/powerlevel10k

plugins=(
    z
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting
    zsh-history-substring-search
    command-not-found
    alias-finder
    dirhistory
    extract
    docker
)

export ZSH_COMPDUMP="$XDG_CACHE_HOME/zcompdump-${HOST}-${ZSH_VERSION}"

ZSH_CACHE_DIR="$XDG_CACHE_HOME/oh-my-zsh"
[[ ! -d $ZSH_CACHE_DIR ]] && mkdir -p "$ZSH_CACHE_DIR"

. "$ZSH/oh-my-zsh.sh"

# history options
# ===============

HISTFILE="$HOME/.zsh_history"
HISTSIZE=150000
SAVEHIST=150000

# man zshoptions /OPTIONNAME
setopt      APPEND_HISTORY
setopt      EXTENDED_HISTORY
setopt      HIST_IGNORE_DUPS
setopt      HIST_IGNORE_SPACE
setopt      SHARE_HISTORY

# incremental history search
autoload -Uz   up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N   up-line-or-beginning-search
zle -N down-line-or-beginning-search
[ -n "${key[Up]}"   ] && bindkey -- "${key[Up]}"     up-line-or-beginning-search
[ -n "${key[Down]}" ] && bindkey -- "${key[Down]}" down-line-or-beginning-search

# completion options
# ==================

autoload -Uz compinit

zstyle ':completion:*' menu select
zmodload zsh/complist

# man zsh-lovers
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME"/zsh-cache

zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always

compinit -d "$XDG_CACHE_HOME/zcompinit"

# zsh options
# ===========

# see 'dirs' command (-c clear stack, -v print stack)
# use 'cd -N' to visit old directory

# man zshoptions /OPTIONNAME
unsetopt    AUTO_CD
setopt      AUTO_PUSHD
setopt      CHASE_LINKS
setopt      PUSHD_IGNORE_DUPS
setopt      PUSHD_SILENT
setopt      EXTENDED_GLOB
setopt      NOMATCH
setopt      APPEND_CREATE
setopt      NOTIFY

# man zshzle
unsetopt    BEEP
bindkey -e

# run 'help builtin_command' to get help on a builtin such as alias
autoload -Uz run-help
unalias run-help
alias help=run-help
autoload -Uz run-help-git run-help-ip run-help-sudo run-help-svn

# Other modules
zmodload zsh/mapfile

[[ ! -f ~/.aliases ]] || . ~/.aliases

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || . ~/.p10k.zsh
