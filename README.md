# .dotfiles

This repo uses the **bare git repository** technique to manage dotfiles. Instead of symlinking or copying files, your actual config files live in their normal locations (`~/.config/nvim`, `~/.bashrc`, etc.) and are tracked by a bare git repo stored in `~/.cfg`.

## How It Works

| Directory | Purpose |
|-----------|---------|
| `~/.cfg` | Bare git repository (stores commits, branches, history) |
| `~/.config/*` | Actual config files that applications read from |
| `$HOME` | The git "working tree" - any file here can be tracked |

The `config` alias is just `git` with custom flags:
```sh
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

## Installing on a New Machine

```sh
# Clone the bare repo
git clone --bare git@github.com:austinwalter/dotfiles.git $HOME/.cfg

# Define the alias (add to .bashrc/.zshrc for persistence)
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Backup existing configs if they conflict
mkdir -p ~/.config-backup
config checkout 2>&1 | grep -E "^\s+" | awk '{print $1}' | xargs -I{} mv {} ~/.config-backup/{}

# Checkout the files
config checkout

# Hide untracked files from status
config config --local status.showUntrackedFiles no
```

## Initializing a New Dotfiles Repo

If you're starting fresh and want to track your configs:

```sh
git init --bare $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc
```

## Daily Usage

Use `config` instead of `git` for all dotfile operations:

```sh
config status                      # See what's changed
config add .config/nvim/init.lua   # Stage a file
config commit -m "Update nvim"     # Commit changes
config push                        # Push to remote
config diff                        # See unstaged changes
config log --oneline               # View history
```

## Neovim

- https://www.vineeth.io/posts/neovim-setup
- https://github.com/VVoruganti/dotfiles
- https://medium.com/@edominguez.se/so-i-switched-to-neovim-in-2025-163b85aa0935
- https://github.com/kikedose/dotfiles/tree/main
- https://github.com/ThePrimeagen/init.lua
- https://gpanders.com/blog/whats-new-in-neovim-0-11/#lsp

## References

- https://www.atlassian.com/git/tutorials/dotfiles
- https://news.ycombinator.com/item?id=11071754
