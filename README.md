managed with `GNU stow`

## Setup

Clone repo into home directory `~/.dotfiles`.

### Install dependencies

First install gnu-stow via the package manager. 

```bash
sudo apt install stow -y
```

Then homebrew / linuxbrew, so we can easily install the rest of our tools. Follow the install guide on [https://brew.sh/](https://brew.sh/).

Last, we can install all the tools in one command.

```bash
brew install \
  # THE editor
  nvim \
  # Interactive filter for any kind of list.
  fzf \
  # Modern, maintained replacement for `ls`.
  eza \ 
  # Fast alternative to `nvm`. Manage language runtimes like Node.js, Python, Ruby, Go, Java, etc and various tools.
  mise \
  # Text search.
  ripgrep \
  # Terminal multiplexer. It allows multiple sessions with windows, panes, and more.
  tmux \
  # Alternative to `cd`. Keep track of the most frequently used directories. Uses a ranking algorithm to navigate to the best match.
  zoxide \
  # An alternative to `find`.
  fd \
  # Powerfull search and replace.
  f2 \
  rg # Ripgrep, a recursive line-oriented search tool. Fast alternative to `grep`.
```

### Link .dotfiles with `stow`

Run `stow .` within `~/.dotfiles` to symlink all files.
