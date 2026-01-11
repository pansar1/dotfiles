# dotfiles

Modern dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## Features

- **One-liner bootstrap** - Set up a new machine with a single command
- **Multi-platform support** - Templates for macOS (Intel/ARM) and Linux
- **Modern tools** - mise, antidote, zoxide, atuin, starship, git-delta
- **Topic-based organization** - Modular configuration by topic
- **Automated setup** - Scripts run automatically on new machines

## Quick Start

### Bootstrap (New Machine)

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply pansar1
```

This single command will:
1. Install chezmoi
2. Clone this dotfiles repository
3. Install Homebrew (if needed)
4. Install all packages from Brewfile
5. Install mise and all runtimes (Node.js, Python, Go)
6. Set up ZSH and antidote plugins
7. Apply all dotfiles to your home directory

Done in 5-10 minutes! 🚀

### Daily Usage

```bash
# Edit a dotfile
chezmoi edit ~/.zshrc

# See what changed
chezmoi diff

# Apply changes
chezmoi apply

# Update from git
chezmoi update

# Commit and push changes
cd $(chezmoi source-path)
git add .
git commit -m "Update dotfiles"
git push
```

## Structure

```
~/.dotfiles/
├── dot_zshrc.tmpl              # ZSH config (templated for multi-platform)
├── dot_gitconfig               # Git config
├── dot_config/                 # XDG config files
│   ├── mise/config.toml        # Runtime version manager
│   ├── starship.toml           # Prompt configuration
│   └── bat/config              # Better cat config
├── topics/                     # Topic-based configs (sourced by zshrc)
│   ├── zsh/                    # ZSH plugins, aliases, functions
│   ├── git/                    # Git helpers
│   ├── mise/                   # Mise configuration
│   └── tools/                  # Tool-specific configs (zoxide, atuin, etc)
├── run_once_before_*.sh        # Run once before applying files
├── run_onchange_after_*.sh     # Run when file changes
└── Brewfile                    # Homebrew packages

```

## Tools Included

- **[mise](https://mise.jdx.dev/)** - Runtime version manager (Node, Python, Go, etc.)
- **[antidote](https://getantidote.github.io/)** - ZSH plugin manager
- **[starship](https://starship.rs/)** - Modern shell prompt
- **[zoxide](https://github.com/ajeetdsouza/zoxide)** - Smart cd command
- **[atuin](https://atuin.sh/)** - Magical shell history
- **[delta](https://github.com/dandavison/delta)** - Better git diffs
- **[bat](https://github.com/sharkdp/bat)** - Better cat with syntax highlighting
- **[eza](https://github.com/eza-community/eza)** - Modern ls replacement
- **[ripgrep](https://github.com/BurntSushi/ripgrep)** - Fast grep
- **[fd](https://github.com/sharkdp/fd)** - Fast find

## Manual Setup (Advanced)

If you prefer to set up manually:

```bash
# Install chezmoi
brew install chezmoi

# Initialize with your dotfiles
chezmoi init https://github.com/pansar1/dotfiles.git

# Review what will be changed
chezmoi diff

# Apply the dotfiles
chezmoi apply
```

## Customization

### Machine-Specific Config

Edit `.chezmoi.toml.tmpl` to add machine-specific variables:

```toml
[data]
    name = "pansar1"
    email = "7646436+pansar1@users.noreply.github.com"
{{- if eq .chezmoi.hostname "work-mac" }}
    email = "work@company.com"
{{- end }}
```

Then use in templates:

```bash
# In dot_gitconfig.tmpl
[user]
    name = {{ .name }}
    email = {{ .email }}
```

### Adding New Dotfiles

```bash
# Add a file to chezmoi
chezmoi add ~/.config/nvim/init.vim

# Add a template (for platform-specific content)
chezmoi add --template ~/.config/some-tool/config
```

## Topics

Configuration is organized by topic for modularity:

- **zsh/** - Shell configuration, aliases, functions, plugins
- **git/** - Git configuration and aliases
- **mise/** - Runtime version manager setup
- **tools/** - Individual tool configurations (zoxide, atuin, etc.)
- **starship/** - Prompt configuration
- **cloud/** - Cloud CLI tools
- **macos/** - macOS-specific settings

## License

MIT

## Credits

Built with [chezmoi](https://www.chezmoi.io/) - Manage your dotfiles across multiple diverse machines, securely.
