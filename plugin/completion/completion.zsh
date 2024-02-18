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

# Detect the operating system
if [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS specific commands
  # Setup LS_COLORS equivalent for macOS
  export CLICOLOR=1
  export LSCOLORS=ExFxCxDxBxegedabagaced
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # Linux specific commands
  # Use dircolors if available to setup LS_COLORS
  if [[ -f ~/.dircolors ]]; then
    eval "$(dircolors -b ~/.dircolors)"
  else
    dircolors -p > "$HOME"/.dircolors
    eval "$(dircolors -b)"
  fi
fi

# color setup
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
