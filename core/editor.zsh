# Use vi keybindings in the command line editor.
bindkey -v

# Make word motions treat punctuation as separators (better for CLI paths/flags).
autoload -Uz select-word-style
select-word-style bash

# Keep key-sequence waiting short so vi mode feels responsive.
KEYTIMEOUT=1

# Safe paste handling for multi-line input.
autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic

# Better handling for pasted URLs and special characters.
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

# Insert-mode navigation and kill/yank shortcuts.
for _keymap in viins emacs; do
  bindkey -M "$_keymap" '^[[1;5D' backward-word
  bindkey -M "$_keymap" '^[[1;5C' forward-word
  bindkey -M "$_keymap" '^[[5D' backward-word
  bindkey -M "$_keymap" '^[[5C' forward-word
  bindkey -M "$_keymap" '^[b' backward-word
  bindkey -M "$_keymap" '^[f' forward-word
  bindkey -M "$_keymap" '^[[3;5~' kill-word
  bindkey -M "$_keymap" '^[^?' backward-kill-word
  bindkey -M "$_keymap" '^W' backward-kill-word
  bindkey -M "$_keymap" '^U' backward-kill-line
  bindkey -M "$_keymap" '^K' kill-line
  bindkey -M "$_keymap" '^Y' yank
  bindkey -M "$_keymap" '^@' set-mark-command
  bindkey -M "$_keymap" '^[w' copy-region-as-kill
  bindkey -M "$_keymap" '^G' kill-region
  bindkey -M "$_keymap" '^[[H' beginning-of-line
  bindkey -M "$_keymap" '^[[F' end-of-line
done
unset _keymap

# Clipboard helpers for copy/paste from the shell editing buffer.
_goldenprompt_clipboard_copy() {
  if (( $+commands[pbcopy] )); then
    pbcopy
  elif (( $+commands[wl-copy] )); then
    wl-copy
  elif (( $+commands[xclip] )); then
    xclip -in -selection clipboard
  elif (( $+commands[xsel] )); then
    xsel --clipboard --input
  else
    return 1
  fi
}

_goldenprompt_clipboard_paste() {
  if (( $+commands[pbpaste] )); then
    pbpaste
  elif (( $+commands[wl-paste] )); then
    wl-paste --no-newline
  elif (( $+commands[xclip] )); then
    xclip -out -selection clipboard
  elif (( $+commands[xsel] )); then
    xsel --clipboard --output
  else
    return 1
  fi
}

goldenprompt-copy-buffer() {
  print -rn -- "$BUFFER" | _goldenprompt_clipboard_copy || {
    zle -M "clipboard command not found (pbcopy/wl-copy/xclip/xsel)"
    return 1
  }
  zle -M "buffer copied to clipboard"
}
zle -N goldenprompt-copy-buffer

goldenprompt-copy-region() {
  zle copy-region-as-kill
  print -rn -- "$CUTBUFFER" | _goldenprompt_clipboard_copy || {
    zle -M "clipboard command not found (pbcopy/wl-copy/xclip/xsel)"
    return 1
  }
  zle -M "selection copied to clipboard"
}
zle -N goldenprompt-copy-region

goldenprompt-paste-clipboard() {
  local paste_text
  paste_text="$(_goldenprompt_clipboard_paste)" || {
    zle -M "clipboard command not found (pbpaste/wl-paste/xclip/xsel)"
    return 1
  }
  LBUFFER+="$paste_text"
}
zle -N goldenprompt-paste-clipboard

for _keymap in viins vicmd emacs; do
  bindkey -M "$_keymap" '^X^Y' goldenprompt-copy-buffer
  bindkey -M "$_keymap" '^X^W' goldenprompt-copy-region
  bindkey -M "$_keymap" '^X^P' goldenprompt-paste-clipboard
done
unset _keymap
