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

## Tools

### Searching
- `rg`: Ripgrep, a recursive line-oriented search tool. Fast alternative to `grep`.
- `eza`: Modern, maintained replacement for `ls`.
- `fd`: An alternative to `find`.
- `f2`: Powerfull search and replace.
- `fzf`: Interactive filter for any kind of list.

### Runtime manager
- `mise`: Fast alternative to `nvm`. Manage language runtimes like Node.js, Python, Ruby, Go, Java, etc and various tools.

### Window management
- `tmux`: Terminal multiplexer. It allows multiple sessions with windows, panes, and more.

### Navigation
- `zoxide`: Alternative to `cd`. Keep track of the most frequently used directories. Uses a ranking algorithm to navigate to the best match.