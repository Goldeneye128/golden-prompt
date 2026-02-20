# GPG pinentry support in interactive sessions.
export GPG_TTY="${TTY:-$(tty 2>/dev/null)}"

# Build PATH with de-duplication.
typeset -U path PATH
path=("$HOME/.local/bin" "$HOME/.cargo/bin" $path)

# Homebrew Ruby takes priority when present.
if [[ -d "/opt/homebrew/opt/ruby/bin" ]]; then
  path=(/opt/homebrew/opt/ruby/bin $path)
  if (( $+commands[gem] )); then
    _goldenprompt_gem_bin="$(command gem environment gemdir 2>/dev/null)/bin"
    [[ -d "$_goldenprompt_gem_bin" ]] && path=("$_goldenprompt_gem_bin" $path)
    unset _goldenprompt_gem_bin
  fi
fi

# Keep unmatched globs literal and disable command auto-correction.
setopt no_nomatch
unsetopt correct
unsetopt correct_all
