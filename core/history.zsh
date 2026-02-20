## History file configuration
[[ -z "$HISTFILE" ]] && HISTFILE="$HOME/.zsh_history"
[[ "$HISTSIZE" -lt 50000 ]] && HISTSIZE=50000
[[ "$SAVEHIST" -lt 10000 ]] && SAVEHIST=10000

## History command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt append_history         # append history instead of rewriting file
setopt inc_append_history     # write to history file immediately
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_all_dups   # remove older duplicate entries
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

for _keymap in emacs viins; do
  bindkey -M "$_keymap" '^[[A' up-line-or-beginning-search
  bindkey -M "$_keymap" '^[[B' down-line-or-beginning-search
done
unset _keymap
