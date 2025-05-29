managed with `GNU stow`

## Setup

Clone repo to home directory, to ensure the directory is `~/.dotfiles`.

### Install dependencies

```bash
brew install \
  stow \
  nvim \
  fzf \
  eza \
  mise \
  ripgrep \
  tmux \
  zoxide \
  fd
```

### Link .dotfiles with `stow`

Run `stow .` within `~/.dotfiles` to symlink all files.
