# Goldenprompt

Goldenprompt is a simple zsh prompt that incorporates fish-like functionality and git integration. 

![Screenshot goldenprompt 1](https://github.com/Goldeneye128/goldenprompt/assets/93520996/a0da594b-268e-4979-ad87-0ac0b7e67e06)

## Features

- Fish-like autosuggestions and syntax highlighting.
- Integrated git support.
- Customizable aliases and functions through user-specific files.
- and more ...

![Screenshot goldenprompt 2](https://github.com/Goldeneye128/goldenprompt/assets/93520996/132ebe0b-9f3e-40df-b77e-63af1a41df89)

## Prerequisites

For the best experience, it is recommended to have the following tools installed:

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

**Note:** The prompt is designed with macOS and linux in mind, it is versatile enough to be adapted for use in most Linux/Unix systems.

## Acknowledgements

Special thanks to:

- [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh): For the sudo, history, and completion functions, and for the inspiration to create Goldenprompt.
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting): For enhancing Zsh with syntax highlighting capabilities.
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions): For providing intelligent suggestions at the terminal.
