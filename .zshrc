# zmodload zsh/zprof

if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR="nvim"
export VISUAL="nvim"
export PNPM_HOME="$HOME/.local/share/pnpm"
export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_DEFAULT_OPTS="--layout=default --border=rounded"

case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

setopt NO_BEEP
setopt AUTO_CD # cd into directory without typing `cd`
setopt AUTO_MENU
setopt NO_MENU_COMPLETE # unblock auto_menu
setopt AUTO_PUSHD
setopt PUSHD_MINUS # Exchanges the meanings of '+' and '-' when used with a number to specify a directory in the stack.
setopt PUSHD_IGNORE_DUPS # dont add duplicates in the stack
setopt PUSHD_SILENT # dont print directory stack after pushd and popd
setopt INTERACTIVECOMMENTS
setopt PROMPT_SUBST
setopt CORRECT

HISTFILE="$HOME/.zsh_history"
HISTSIZE=1000000                 # Set the amount of lines you want saved
SAVEHIST=1000000                 # This is required to actually save them, needs to match with HISTSIZE
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don\'t record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don\'t record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don\'t write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.

alias ll='ls -la'
alias l='ls -gaho --color'
alias ..='cd ..'
alias c='clear'
alias lg='lazygit'
alias pn='pnpm'
alias l='eza -l'
alias la='eza -la'
alias e='eza'
alias ea='eza -a'
alias docker='podman'

if [[ $(uname) == "Linux" ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# zinit pack for fzf
zinit light Aloxaf/fzf-tab

zinit ice blockf atpull'zinit creinstall -q .'
zinit light zsh-users/zsh-completions

autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions

zinit as="command" lucid from="gh-r" for \
  id-as="usage" \
  atpull="%atclone" \
  jdx/usage
  #atload='eval "$(mise activate zsh)"' \

zinit as="command" lucid from="gh-r" for \
  id-as="mise" mv="mise* -> mise" \
  atclone="./mise* completion zsh > _mise" \
  atpull="%atclone" \
  atload='eval "$(mise activate zsh)"' \
  jdx/mise

[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"

zinit ice as"command" from"gh-r" \
  atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
  atpull"%atclone" src"init.zsh"
zinit light starship/starship

bindkey -e # unset vi mode. because it has weird keymaps for the terminal
bindkey '^F' autosuggest-accept
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

# zprof
eval "$(zoxide init zsh)"
