# alias cd
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# alias history
alias history="history 0"

# alias ls
alias ls="eza --color always --icons --sort name --group-directories-first"
alias la="eza --color always --icons --sort name --group-directories-first --long --all"
alias ll="eza --color always --icons --sort name --group-directories-first --long"
alias l="eza --color always --icons --sort name --group-directories-first --long"

#alias shortcuts
alias q="exit"
alias v="nvim"
alias c="clear"
alias sv="sudo vim"
alias za="nvim $HOME/.alias.zsh"
alias zf="nvim $HOME/.function.zsh"
alias sz="source $HOME/.config/goldenprompt/.zshrc"

# source user-alias
if [ ! -f "$HOME/.config/goldenprompt/plugin/alias/user-alias.zsh" ]; then
    touch "$HOME/.config/goldenprompt/plugin/alias/user-alias.zsh"
fi
source $HOME/.alias.zsh
