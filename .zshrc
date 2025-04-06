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

case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Enter a path to cd to it
setopt auto_cd

# "Automatically use menu completion after the second consecutive
# request for completion, for example by pressing the tab key
# repeatedly. This option is overridden by MENU_COMPLETE."
# https://zsh.sourceforge.io/Doc/Release/Options.html#Completion-4
setopt auto_menu
unsetopt menu_complete # Unset to unblock auto_menu

# "Make cd push the old directory onto the directory stack."
# https://zsh.sourceforge.io/Doc/Release/Options.html#Changing-Directories
setopt auto_pushd

setopt pushd_minus # Exchanges the meanings of '+' and '-' when used with a number to specify a directory in the stack.
setopt pushd_ignore_dups # dont share duplicates in the stack
setopt pushd_silent # dont print directory stack after pushd and popd

# "If unset, the cursor is set to the end of the word if completion is
# started. Otherwise it stays there and completion is done from both
# ends."
# https://zsh.sourceforge.io/Doc/Release/Options.html#Completion-4
setopt complete_in_word

# "Turns on interactive comments; comments begin with a #."
# https://zsh.sourceforge.io/Intro/intro_16.html
#
# That is, enable comments in the terminal. Nice when copying and
# pasting from documentation/tutorials, and disable part of
# a command pulled up from history.
setopt interactivecomments

# "Beep on an ambiguous completion. More accurately, this forces the
# completion widgets to return status 1 on an ambiguous completion,
# which causes the shell to beep if the option BEEP is also set; this
# may be modified if completion is called from a user-defined widget."
# https://zsh.sourceforge.io/Doc/Release/Options.html#Completion-4
unsetopt list_beep

# "If set, parameter expansion, command substitution and arithmetic
# expansion are performed in prompts. Substitutions within prompts do
# not affect the command status."
# https://zsh.sourceforge.io/Doc/Release/Options.html#Prompting
setopt prompt_subst

HISTFILE="$HOME/.zsh_history"
HISTSIZE=1100000000
SAVEHIST=1000000000
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_ignore_space
setopt share_history

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

if [[ $(uname) == "Linux" ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

zinit pack for fzf
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

bindkey '^F' autosuggest-accept
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

# zprof
