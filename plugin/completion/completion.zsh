# Load completion system
autoload -U compinit
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Bindkey setup
bindkey -M menuselect '^[[Z' reverse-menu-complete

# Completion menu style
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# color setup
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
