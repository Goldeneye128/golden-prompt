# Write an ISO image to a selected block device.
usbburn() {
  local iso="$1"
  local device="$2"

  if [[ -z "$iso" || -z "$device" ]]; then
    print -u2 "usage: usbburn <iso-path> <device>"
    return 1
  fi
  if [[ ! -f "$iso" ]]; then
    print -u2 "usbburn: file not found: $iso"
    return 1
  fi
  if [[ "$device" != /dev/* ]]; then
    print -u2 "usbburn: device must start with /dev/"
    return 1
  fi

  sudo dd bs=4M if="$iso" of="$device" conv=fsync oflag=direct status=progress
}

# Hash a password using SHA512 crypt.
hashpass() {
  local value="$1"
  if [[ -z "$value" ]]; then
    read -rs "value?password: "
    print
  fi

  if (( $+commands[python3] )); then
    python3 -c 'import crypt,sys; print(crypt.crypt(sys.argv[1], crypt.mksalt(crypt.METHOD_SHA512)))' "$value"
  else
    print -u2 "hashpass: python3 is required"
    return 1
  fi
}

# Create and push signed tag for "<major>.0".
tag-git() {
  local major="$1"
  if [[ -z "$major" ]]; then
    print -u2 "usage: tag-git <major>"
    return 1
  fi
  git tag -s -a "v${major}.0" -m "version ${major}.0" && git push --tags
}

# Quick add/commit/push with optional message.
gitz() {
  local today message
  today="$(date +%Y-%m-%d)"
  message="${1:-update ${today}}"

  git add -A || return 1
  if git diff --cached --quiet; then
    print "gitz: nothing to commit"
    return 0
  fi
  git commit -S -v -m "$message" && git push
}

# Run a command, print output, and copy stdout to the system clipboard.
_goldenprompt_copy_to_clipboard() {
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

cc() {
  if (( $# == 0 )); then
    print -u2 "usage: cc <command> [args...]"
    return 2
  fi

  local tmp rc
  tmp="$(mktemp -t goldenprompt-cc.XXXXXX 2>/dev/null || mktemp)"
  [[ -n "$tmp" ]] || return 1

  "$@" | tee "$tmp"
  rc=${pipestatus[1]}

  if _goldenprompt_copy_to_clipboard <"$tmp"; then
    print -u2 "cc: output copied to clipboard"
  else
    print -u2 "cc: clipboard command not found (pbcopy/wl-copy/xclip/xsel)"
  fi

  rm -f "$tmp"
  return "$rc"
}

# Source user functions.
typeset -g GOLDENPROMPT_USER_FUNCTION_FILE="${GOLDENPROMPT_USER_FUNCTION_FILE:-$HOME/.goldenprompt_functions.zsh}"
if [[ ! -f "$GOLDENPROMPT_USER_FUNCTION_FILE" && -f "$HOME/.function.zsh" ]]; then
  GOLDENPROMPT_USER_FUNCTION_FILE="$HOME/.function.zsh"
fi
[[ -f "$GOLDENPROMPT_USER_FUNCTION_FILE" ]] || touch "$GOLDENPROMPT_USER_FUNCTION_FILE"
source "$GOLDENPROMPT_USER_FUNCTION_FILE"
