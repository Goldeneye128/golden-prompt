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
# Detect the operating system
if [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS specific commands
  # Setup LS_COLORS equivalent for macOS
  export CLICOLOR=1
  export LSCOLORS=ExFxCxDxBxegedabagaced
  # Adjust completion colors for macOS
  zstyle ':completion:*:default' list-colors 'di=34' 'ln=35' 'so=32' 'pi=33' 'ex=31'
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # Linux specific commands
  # Use dircolors if available to setup LS_COLORS
  if [[ -f ~/.dircolors ]]; then
    eval "$(dircolors -b ~/.dircolors)"
  else
    dircolors -p > "$HOME"/.dircolors
    eval "$(dircolors -b)"
  fi
  # Setup for Linux is handled by LS_COLORS directly
  zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
fi
