# directory movement
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# history
alias history="history 0"

# listing defaults
if (( $+commands[eza] )); then
  alias ls="eza --color always --icons --sort name --group-directories-first"
  alias la="eza --color always --icons --sort name --group-directories-first --long --all"
  alias ll="eza --color always --icons --sort name --group-directories-first --long"
  alias l="eza --color always --icons --sort name --group-directories-first --long"
else
  alias la="ls -la"
  alias ll="ls -l"
  alias l="ls -l"
fi

# source user aliases
typeset -g GOLDENPROMPT_USER_ALIAS_FILE="${GOLDENPROMPT_USER_ALIAS_FILE:-$HOME/.goldenprompt_aliases.zsh}"
if [[ ! -f "$GOLDENPROMPT_USER_ALIAS_FILE" && -f "$HOME/.alias.zsh" ]]; then
  GOLDENPROMPT_USER_ALIAS_FILE="$HOME/.alias.zsh"
fi
[[ -f "$GOLDENPROMPT_USER_ALIAS_FILE" ]] || touch "$GOLDENPROMPT_USER_ALIAS_FILE"
source "$GOLDENPROMPT_USER_ALIAS_FILE"

# source user functions file for edit shortcut if already known
typeset -g GOLDENPROMPT_USER_FUNCTION_FILE="${GOLDENPROMPT_USER_FUNCTION_FILE:-$HOME/.goldenprompt_functions.zsh}"
if [[ ! -f "$GOLDENPROMPT_USER_FUNCTION_FILE" && -f "$HOME/.function.zsh" ]]; then
  GOLDENPROMPT_USER_FUNCTION_FILE="$HOME/.function.zsh"
fi

# shortcuts
alias q="exit"
alias v="nvim"
alias c="clear"
alias sv="sudo nvim"
alias za="nvim $GOLDENPROMPT_USER_ALIAS_FILE"
alias zf="nvim $GOLDENPROMPT_USER_FUNCTION_FILE"
alias sz="source ${GOLDENPROMPT_HOME:-$HOME/.config/goldenprompt}/goldenprompt.zsh"
