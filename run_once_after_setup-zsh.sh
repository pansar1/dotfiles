#!/bin/bash
set -e

mkdir -p "${XDG_DATA_HOME:-$HOME/.local/share}/zsh"
mkdir -p "${XDG_CACHE_HOME:-$HOME/.cache}/zsh"

ANTIDOTE_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/antidote"
if [[ ! -d "$ANTIDOTE_HOME" ]]; then
    git clone --depth=1 https://github.com/mattmc3/antidote.git "$ANTIDOTE_HOME"
    echo "✓ Antidote installed"
fi

if [[ "$SHELL" != */zsh ]]; then
    if ! grep -q "$(which zsh)" /etc/shells; then
        echo "$(which zsh)" | sudo tee -a /etc/shells
    fi
    chsh -s "$(which zsh)"
    echo "✓ ZSH set as default shell"
fi
