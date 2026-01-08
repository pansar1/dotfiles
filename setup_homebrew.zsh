#!/usr/bin/env zsh

echo "\n<<< Starting Homebrew Setup >>>\n"

exists() { command -v "$1" >/dev/null 2>&1; }

if exists brew; then
    echo "brew exists, skipping install"
else
    echo "brew doesn't exists, continuing with install"
    # Install homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew bundle --verbose
