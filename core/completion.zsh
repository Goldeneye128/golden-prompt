autoload -Uz compinit
zmodload zsh/complist

: "${XDG_CACHE_HOME:=$HOME/.cache}"
[[ -d "$XDG_CACHE_HOME/zsh" ]] || mkdir -p "$XDG_CACHE_HOME/zsh"
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"
_comp_options+=(globdots)

bindkey -M menuselect '^[[Z' reverse-menu-complete

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh"

if [[ "$OSTYPE" == darwin* ]]; then
  export CLICOLOR=1
  export LSCOLORS=ExFxCxDxBxegedabagaced
  zstyle ':completion:*:default' list-colors 'di=34:ln=35:so=32:pi=33:ex=31'
elif (( $+commands[dircolors] )); then
  if [[ -f "$HOME/.dircolors" ]]; then
    eval "$(dircolors -b "$HOME/.dircolors")"
  else
    eval "$(dircolors -b)"
  fi
  [[ -n "$LS_COLORS" ]] && zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
fi
