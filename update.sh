#!/usr/bin/env bash
set -euo pipefail

REPO_URL="${GOLDENPROMPT_REPO_URL:-https://github.com/Goldeneye128/goldenprompt.git}"
INSTALL_DIR="${GOLDENPROMPT_INSTALL_DIR:-$HOME/.config/goldenprompt}"

if [[ -n "${ZDOTDIR:-}" ]]; then
  RC_FILE="${GOLDENPROMPT_RC_FILE:-$ZDOTDIR/.zshrc}"
else
  RC_FILE="${GOLDENPROMPT_RC_FILE:-$HOME/.zshrc}"
fi

if [[ ! -f "$RC_FILE" ]]; then
  RC_FILE="${GOLDENPROMPT_RC_FILE:-$HOME/.zprofile}"
fi

SOURCE_LINE="source \"$INSTALL_DIR/goldenprompt.zsh\""

if [[ ! -d "$INSTALL_DIR/.git" ]]; then
  echo "Goldenprompt not found at $INSTALL_DIR; bootstrapping install"
  mkdir -p "$(dirname "$INSTALL_DIR")"
  git clone --recurse-submodules "$REPO_URL" "$INSTALL_DIR"
fi

cd "$INSTALL_DIR"

echo "Updating Goldenprompt in $INSTALL_DIR"
git fetch --all --prune
git pull --ff-only

git submodule sync --recursive
git submodule update --init --recursive

mkdir -p "$(dirname "$RC_FILE")"
touch "$RC_FILE"

if ! grep -Fq "$INSTALL_DIR/goldenprompt.zsh" "$RC_FILE"; then
  {
    echo
    echo "# Goldenprompt"
    echo "$SOURCE_LINE"
  } >> "$RC_FILE"
  echo "Added Goldenprompt source line to $RC_FILE"
fi

echo "Done. Restart your shell or run: source \"$RC_FILE\""
