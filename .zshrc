# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# zmodload zsh/zprof

source $HOME/.zshcustom/keybinds.zsh
source $HOME/.zshcustom/alias.zsh
source $HOME/.zshcustom/plugins.zsh

if [[ $(uname) == "Darwin" ]]; then
  source $HOME/.zshcustom/macos.zsh
fi
if [[ $(uname) == "Linux" ]]; then
  source $HOME/.zshcustom/linux.zsh
fi

source $HOME/.zshcustom/env.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# zprof
