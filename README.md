# Goldenprompt

Goldenprompt is a lightweight Zsh setup with:

- Git-aware prompt.
- Autosuggestions and syntax highlighting.
- Vi-friendly command-line editing and safer paste behavior.
- Optional `fzf` keybindings/completion integration.
- User override files for aliases and functions.

![Goldenprompt screenshot 1](https://github.com/Goldeneye128/goldenprompt/assets/93520996/a0da594b-268e-4979-ad87-0ac0b7e67e06)

## Install

Clone into your config directory:

```bash
git clone --recurse-submodules https://github.com/Goldeneye128/goldenprompt.git "$HOME/.config/goldenprompt"
```

Source it from your real `~/.zshrc` (or `~/.zprofile`):

```zsh
source "$HOME/.config/goldenprompt/goldenprompt.zsh"
```

Restart your shell.

## Quick Installer

If you prefer a one-command setup:

```bash
bash install.sh
```

This will clone/update Goldenprompt and add the source line to your `~/.zshrc` (or `~/.zprofile` fallback).

## Quick Update

To update Goldenprompt (including scripts and submodules):

```bash
bash update.sh
```

## File Layout

- `goldenprompt.zsh`: Main entrypoint.
- `core/`: First-party config modules.
- `vendor/`: Third-party prompt/plugins as git submodules.

If you already cloned without submodules:

```bash
cd "$HOME/.config/goldenprompt"
git submodule update --init --recursive
```

## Customization

Goldenprompt auto-sources user files:

- `~/.goldenprompt_aliases.zsh`
- `~/.goldenprompt_functions.zsh`

For backward compatibility, if those are missing, it will fall back to:

- `~/.alias.zsh`
- `~/.function.zsh`

## Notes

- `eza` is optional and used for enhanced `ls` aliases when installed.
- `nvim` is optional and used by convenience aliases.
- `fzf` is optional. Goldenprompt ships built-in `Ctrl+R`/`Ctrl+T` fzf widgets.
- Set `GOLDENPROMPT_USE_USER_FZF_ZSH=1` if you prefer to source your existing `~/.fzf.zsh`.
- Works on both macOS and Linux.

## Kitty Notes

- If you use Kitty across macOS and Linux, include `docs/kitty.conf` in your Kitty config.
- On macOS, `macos_option_as_alt yes` is important for `Alt+b` / `Alt+f` style word movement.
- In `~/.config/kitty/kitty.conf`, add:

```conf
include ~/.config/goldenprompt/docs/kitty.conf
```

## Editing Shortcuts Added

- `Ctrl+Left` and `Ctrl+Right`: move by word.
- `Alt+b` and `Alt+f`: move by word.
- `Ctrl+A` and `Ctrl+E`: move to beginning/end of line.
- `Ctrl+W`, `Ctrl+U`, `Ctrl+K`, `Ctrl+Y`: delete/yank in insert mode.
- `Ctrl+X Ctrl+Y`: copy full command buffer to system clipboard.
- `Ctrl+X Ctrl+W`: copy selected region to system clipboard.
- `Ctrl+X Ctrl+P`: paste from system clipboard.
- Vi mode: prompt shows `[I]` for insert mode and `[N]` for normal mode on the right side.
- Vi mode controls: press `Esc` for normal mode, `i` to return to insert mode.

## Updating Vendor Plugins

```bash
cd "$HOME/.config/goldenprompt"
git submodule update --init --recursive
git submodule update --remote --recursive
# or use the helper:
./scripts/update-vendor.sh
```

![Goldenprompt screenshot 2](https://github.com/Goldeneye128/goldenprompt/assets/93520996/132ebe0b-9f3e-40df-b77e-63af1a41df89)

## Acknowledgements

- [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
