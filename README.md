managed with `GNU stow`

## Setup

Clone repo to home directory, to ensure the directory is `~/.dotfiles`.

### Install dependencies

First install gnu-stow via the package manager. 

```bash
sudo apt install stow
```

Then homebrew / linuxbrew, so we can easily install the rest of our tools. Follow the install guide on [https://brew.sh/](https://brew.sh/).

Last, we can install all the tools in one command.

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
