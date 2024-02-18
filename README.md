# Goldenprompt

Goldenprompt is a simplistic yet powerful Zsh prompt that incorporates fish-like functionality and seamless git integration. Designed to enhance the terminal experience, it offers a blend of efficiency and aesthetic appeal for developers and terminal enthusiasts alike.

## Features

- Fish-like autosuggestions and syntax highlighting for efficient command entry.
- Integrated git support to keep track of your repositories' status directly from your prompt.
- Customizable aliases and functions through user-specific files for a tailored terminal experience.

## Prerequisites

For the best experience with Goldenprompt, it is recommended to have the following tools installed:

- `eza`: A command-line utility for easier alias management.
- `neovim`: An extensible text editor that offers improved functionality over Vim.

## Installation

### Step 1: Clone the Repository

Clone Goldenprompt into your `.config` directory:

```bash
git clone https://github.com/Goldeneye128/goldenprompt.git $HOME/.config/goldenprompt
```

### Step 2: Configuration

To activate Goldenprompt, add the following to your `.zprofile`:

```bash
export ZDOTDIR="$HOME/.config/goldenprompt"

Alternatively, you can source Goldenprompt in your `.zshrc`:

```bash
source "$HOME/.config/goldenprompt/.zshrc"
```

### Step 3: Relog

For the changes to take effect, relog into your account.

### Step 4: Customize

Modify `user-alias.zsh` and `user-function.zsh` according to your preference. These files can be edited directly or symlinked to your custom Zsh aliases and functions for enhanced personalization.

![Screenshot of zsh goldenprompt](https://github.com/Goldeneye128/goldenprompt/assets/93520996/6e3ade05-31b2-40f5-9890-1bfce3488632)

**Note:** While Goldenprompt is designed with macOS in mind, it is versatile enough to be adapted for use in most Linux/Unix systems.

## Acknowledgements

Special thanks to:

- [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh): For the sudo, history, and completion functions, and for the inspiration to create Goldenprompt.
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting): For enhancing Zsh with syntax highlighting capabilities.
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions): For providing intelligent suggestions at the terminal.

Goldenprompt aims to streamline your terminal interactions and make your command-line experience as productive and enjoyable as possible.
