# Define the base directory for plugins
pluginDir="$HOME/.config/goldenprompt/plugin"

# List all plugins you want to source
plugins=(
  "config" 
  "alias" 
  "function" 
  "sudo" 
  "history" 
  "completion" 
  "git-prompt" 
  "zsh-autosuggestions" 
  "zsh-syntax-highlighting"
)

# Loop through the plugins and source each one
for plugin in ${plugins[@]}; do
    filePath="$pluginDir/$plugin/$plugin.zsh"
    if [[ -f $filePath ]]; then
        source $filePath
    else
        echo "Warning: File $filePath not found."
    fi
done
