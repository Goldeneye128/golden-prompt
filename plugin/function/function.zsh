# function alias

# Update Alias
function up() {
    green='\033[0;32m'
    nc='\033[0m'
    echo -e "${green}Updating System${nc}"
    echo -en "${green}Type your admin password: ${nc}"
    read -s PASSWD
    echo -e ""
    pwd=$(pwd)
    cd $HOME/settings/Brewfiles 
    echo -e "${green}Updating Brewfiles${nc}"
    rm Brewfile 
    rm Brewfile.lock.json 
    brew bundle dump 
    echo -e "${green}Updating Repository${nc}"
    brew update
    brew upgrade
    brew bundle
    echo -e "${green}Cleaning up System${nc}"
    brew cleanup --prune=all
    brew bundle cleanup --force
    brew doctor
    echo -e "$PASSWD\n" | sudo -S rm -rf $HOME/.Trash/*
    echo -e ""
    echo -e "${green}Updating pip Repository${nc}"
    pip-review --auto
    for i in $(pip3 list -o | awk 'NR > 2 {print $1}'); do sudo pip3 install -U $i; done
    echo -e "${green}Updating Ruby${nc}"
    gem update
    update_rubygems
    gem update --system
    echo -e "${green}Updating npm${nc}"
    npm update -g
    npm install npm@latest -g
    echo -e "${green}Updating MacOS${nc}"
    cd $pwd
    echo -e "$PASSWD\n" | sudo -S softwareupdate -iaR —verbose
    echo -e ""
    PASSWD="Nothing too see here"
    echo -e "${green}System is up to date${nc}"
}

# uptime
  function ut() {
  boottime=`sysctl -n kern.boottime | awk '{print $4}' | sed 's/,//g'`
  unixtime=`date +%s`
  timeAgo=$(($unixtime - $boottime))
  uptime=`awk -v time=$timeAgo 'BEGIN { seconds = time % 60; minutes = int(time / 60 % 60); hours = int(time / 60 / 60 % 24); days = int(time / 60 / 60 / 24); printf("%.0f days, %.0f hours, %.0f minutes, %.0f seconds", days, hours, minutes, seconds); exit }'`
  echo $uptime
}

function usbburn() {
  local iso=$1
  sudo dd bs=4M if=$iso of=/dev/sda conv=fsync oflag=direct status=progress
}

function hashpass() {
    python -c "import crypt; print(crypt.crypt('$1', crypt.mksalt(crypt.METHOD_SHA512)))"
}

function tag() {
	git tag -a v$1.0 -m "version $1.0"
	git push --tag
}

function gitz() {
  datos=$(date +%Y-%m-%d)
	git add .
	git commit -S -v -a -m "$([ "$1" != "" ] && echo "$1" || echo "update $datos")"
	git push
}

