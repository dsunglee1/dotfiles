# Dotfiles

Managed with a [bare git repo](https://www.atlassian.com/git/tutorials/dotfiles) — files live in their default locations and are tracked with git from `~/.dotfiles`.

## What's included

- `.zshrc` — shell config, aliases, PATH
- `.zprofile` — login shell setup
- `.zsh_plugins.txt` — [antidote](https://getantidote.github.io/) plugin list
- `.gitignore` — whitelist-based ignore for the bare repo
- `.config/nvim/` — Neovim config
- `.config/git/` — Git config and global ignore
- `.config/ghostty/` — Ghostty terminal config
- `.config/karabiner/` — Karabiner-Elements keyboard remapping
- `.config/tmux/` — Tmux config

## Setup on a new Mac

```bash
# 1. Clone the bare repo
git clone --bare git@github.com:YOURUSER/dotfiles.git ~/.dotfiles

# 2. Define the alias for this session
alias dot='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# 3. Checkout files into ~
dot checkout

# If checkout fails due to existing files (e.g. default .zshrc):
dot checkout 2>&1 | grep "^\t" | xargs -I{} mv {} {}.bak
dot checkout

# 4. Hide untracked files
dot config status.showUntrackedFiles no
```

Open a new terminal and you're set. Antidote will clone plugins on first shell load.

## Usage

The `dot` alias (defined in `.zshrc`) replaces `git` for this repo:

```bash
dot status
dot add ~/.zshrc
dot commit -m "update shell config"
dot push
```
