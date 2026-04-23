if not status is-interactive
    return
end

# Environment variables
set -gx EDITOR nvim
set -gx SUDO_EDITOR nvim
set -gx VISUAL nvim
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx NX_TUI false
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
set -gx FZF_DEFAULT_COMMAND "fd --type f"
set -gx FZF_DEFAULT_OPTS "--layout=default --border=rounded"
set -gx PAGER "less -F -X"

# Path
fish_add_path "$PNPM_HOME"
fish_add_path "$HOME/.local/bin"
fish_add_path "$HOME/.opencode/bin"
fish_add_path "$HOME/.deno/bin"

# Linux brew (only on Linux)
if test (uname) = Linux
    eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
end

# Aliases
alias ll 'eza -l'
alias l  'eza'
alias ..  'cd ..'
alias c  'clear'
alias lg 'lazygit'
alias pn 'pnpm'
alias e  'eza'
alias docker 'podman'
alias acli 'acli-pii'

# Tool integrations
# Atuin (shell history)
atuin init fish --disable-up-arrow | source

# mise (runtime manager)
mise activate fish | source

# Zoxide (smart cd)
zoxide init fish | source

# Keybinds
# Fish uses bind, not bindkey
# Ctrl+F to accept autosuggestion (fish does this by default with →, but let's keep your habit)
bind \cf accept-autosuggestion
# Ctrl+P / Ctrl+N for history search
bind \cp history-search-backward
bind \cn history-search-forward

# Disable greeting
# set -g fish_greeting

# set -g fish_history default
