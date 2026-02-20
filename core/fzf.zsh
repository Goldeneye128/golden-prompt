# Optional fzf integration for history/file navigation.
: "${GOLDENPROMPT_ENABLE_FZF:=1}"
[[ "$GOLDENPROMPT_ENABLE_FZF" == "1" ]] || return 0
(( $+commands[fzf] )) || return 0

# Optionally prefer user-managed fzf setup when explicitly enabled.
if [[ "${GOLDENPROMPT_USE_USER_FZF_ZSH:-0}" == "1" && -r "$HOME/.fzf.zsh" ]]; then
  source "$HOME/.fzf.zsh"
  return 0
fi

# Minimal built-in fzf history picker.
goldenprompt-fzf-history-widget() {
  local selected
  selected="$(
    fc -rl 1 \
      | sed -E 's/^[[:space:]]*[0-9]+[[:space:]]+//' \
      | awk '!seen[$0]++' \
      | fzf --height=40% --reverse --prompt='history> '
  )" || return 0

  BUFFER="$selected"
  CURSOR=${#BUFFER}
  zle redisplay
}
zle -N goldenprompt-fzf-history-widget

# Minimal built-in fzf file picker.
goldenprompt-fzf-file-widget() {
  local selected
  selected="$(
    command find . -mindepth 1 \( -type f -o -type d \) 2>/dev/null \
      | sed 's|^\./||' \
      | fzf --height=40% --reverse --prompt='path> '
  )" || return 0

  LBUFFER+="${(q-)selected}"
  zle redisplay
}
zle -N goldenprompt-fzf-file-widget

for _keymap in viins emacs; do
  bindkey -M "$_keymap" '^R' goldenprompt-fzf-history-widget
  bindkey -M "$_keymap" '^T' goldenprompt-fzf-file-widget
done
unset _keymap
