source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

export EDITOR="nvim"
export SUDO_EDITOR="nvim"
export VISUAL="nvim"

export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_DEFAULT_OPTS="--layout=default --border=rounded"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

atuin init fish --disable-up-arrow | source

~/.local/bin/mise activate fish | source
