# Main entrypoint for Goldenprompt.
# Source this file from your real ~/.zshrc or ~/.zprofile.

typeset -g GOLDENPROMPT_HOME="${${(%):-%N}:A:h}"

# This setup is intended for interactive shells.
[[ -o interactive ]] || return 0 2>/dev/null || true

typeset -a _goldenprompt_modules=(
  "$GOLDENPROMPT_HOME/core/config.zsh"
  "$GOLDENPROMPT_HOME/core/aliases.zsh"
  "$GOLDENPROMPT_HOME/core/functions.zsh"
  "$GOLDENPROMPT_HOME/core/history.zsh"
  "$GOLDENPROMPT_HOME/core/completion.zsh"
  "$GOLDENPROMPT_HOME/core/fzf.zsh"
  "$GOLDENPROMPT_HOME/core/editor.zsh"
  "$GOLDENPROMPT_HOME/core/sudo.zsh"
  "$GOLDENPROMPT_HOME/vendor/git-prompt/git-prompt.zsh"
  "$GOLDENPROMPT_HOME/vendor/zsh-autosuggestions/zsh-autosuggestions.zsh"
  "$GOLDENPROMPT_HOME/vendor/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
  "$GOLDENPROMPT_HOME/core/prompt.zsh"
)

for _module_file in "${_goldenprompt_modules[@]}"; do
  if [[ -r "$_module_file" ]]; then
    source "$_module_file"
  else
    print -u2 "goldenprompt: missing module: $_module_file"
    print -u2 "goldenprompt: run 'git submodule update --init --recursive' if vendor modules are missing"
  fi
done

unset _module_file _goldenprompt_modules
