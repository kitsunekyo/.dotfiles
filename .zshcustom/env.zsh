export XDG_CONFIG_HOME="$HOME/.config"

[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"

export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# mise-en-place
eval "$($HOME/.local/bin/mise activate zsh)"

export EDITOR="nvim"
export VISUAL="nvim"
