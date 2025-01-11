# function alias

# function to burn iso
function usbburn() {
  local iso=$1
  sudo dd bs=4M if=$iso of=/dev/sda conv=fsync oflag=direct status=progress
}

# hash passwords
function hashpass() {
    python -c "import crypt; print(crypt.crypt('$1', crypt.mksalt(crypt.METHOD_SHA512)))"
}

# simple git tager
function tag-git() {
	git tag -s -a v$1.0 -m "version $1.0"
	git push --tag
}

# lazy git
function gitz() {
  datos=$(date +%Y-%m-%d)
	git add .
	git commit -S -v -a -m "$([ "$1" != "" ] && echo "$1" || echo "update $datos")"
	git push
}

# source user-function.zsh
if [ ! -f "$HOME/.config/goldenprompt/plugin/function/user-function.zsh" ]; then
    touch "$HOME/.config/goldenprompt/plugin/function/user-function.zsh"
fi
source $HOME/.function.zsh
