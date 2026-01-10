#!/bin/bash
set -e

BREWFILE="{{ .chezmoi.sourceDir }}/Brewfile"

if [[ -f "$BREWFILE" ]]; then
    brew bundle --file="$BREWFILE"
    echo "✓ Packages installed"
fi

if command -v mise &> /dev/null; then
    mise install
    echo "✓ Mise runtimes installed"
fi
