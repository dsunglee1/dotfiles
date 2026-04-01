# history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS SHARE_HISTORY
export SHELL_SESSIONS_DISABLE=1

# path
export PATH="/opt/homebrew/opt/git/bin:$PATH"
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# aliases
alias dot='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias vim="nvim"
alias ll="eza -lah --git"
alias cf="caffeinate -id"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

source "$HOME/.antidote/antidote.zsh"
antidote load

autoload -Uz promptinit && promptinit && prompt pure
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
