managed with `GNU stow`

## Install

`brew install stow`

## Setup

Clone repo to home directory, to ensure the directory is `~/.dotfiles`.

Run `stow .` within `~/.dotfiles` to symlink all files.

## Packages

Ensure these are installed.

- fzf (installed via brew)
- nvim
- rg (ripgrep)
- fd (fd-find)
- mise: `nvm` replacement.
- eza: `ls` replacement. use with aliases `e`, `ea`, (inline) `l`, `la` (list)

For linux, install linuxbrew.

## Features

### zsh

- `cd -` to jump between directories before and after a `cd` (like `git switch -`)
- typing just directory name without `cd` will automatically `cd` into the directory
