# export gpg
export GPG_TTY=$(tty)

# export paths
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:/home/$USER/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:/Users/christiandevik/.local/bin:$PATH"
export PATH="$PATH:/Users/christiandevik/.local/bin:$PATH"

# Ruby homebrew takes priority
if [ -d "/opt/homebrew/opt/ruby/bin" ]; then
  export PATH=/opt/homebrew/opt/ruby/bin:$PATH
  export PATH=`gem environment gemdir`/bin:$PATH
  export PATH=/Users/christiandevik/.cargo/bin:$PATH
fi

# setop no nomatch
setopt no_nomatch

# disable command auto-correction
ENABLE_CORRECTION="false"
