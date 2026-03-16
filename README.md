# dotfiles

Managed with [GNU stow](https://www.gnu.org/software/stow/).

## Arch Linux Setup

### 1. Install Arch & create a user

Follow the official [Arch Linux installation guide](https://wiki.archlinux.org/title/Installation_guide).

After the base install, create a non-root user and add them to the `wheel` group (use bash as the temporary default shell):

```bash
useradd -m -G wheel -s /usr/bin/bash myuser
passwd myuser
```

Then grant the `wheel` group sudo access. See the [Arch wiki on sudo](https://wiki.archlinux.org/title/Sudo#Example_entries) for details.

```bash
EDITOR=nvim visudo
```

Uncomment the following line:

```
%wheel ALL=(ALL:ALL) ALL
```

Log out of root and switch to your new user from here on.

---

### 2. Install base packages

`yay` is an AUR helper built on top of pacman. Install it first, then use it for everything else — it handles both official repo and AUR packages with the same interface.

#### Install yay (AUR helper)

```bash
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git /tmp/yay
cd /tmp/yay && makepkg -si
```

See the [yay GitHub page](https://github.com/Jguer/yay) for more info.

#### Install packages

```bash
yay -S --needed \
  fish \
  stow \
  git \
  neovim \
  mise \
  atuin \
  eza \
  fd \
  ripgrep \
  zoxide \
  bat \
  tldr \
  tmux \
  f2-bin \
  nmap \
  openssh \
  man-db \
  sudo \
  which \
  base-devel
```

**Key tools:**

| Tool | Purpose |
|------|---------|
| `mise` | Dev tool & runtime version manager (node, go, rust, pnpm, fzf, ...) |
| `yay` | AUR helper / pacman wrapper |
| `atuin` | Shell history with search and sync |
| `zoxide` | Smarter `cd` with frecency ranking |
| `eza` | Modern `ls` replacement |
| `fd` | Fast alternative to `find` |
| `ripgrep` | Fast `grep` replacement |
| `bat` | `cat` with syntax highlighting |
| `tmux` | Terminal multiplexer |
| `neovim` | Editor |
| `stow` | Symlink manager for dotfiles |

---

### 3. Set fish as default shell

Now that fish is installed via pacman, switch your user's shell to fish:

```bash
chsh -s $(which fish)
```

Log out and back in for the change to take effect.

---

### 4. Clone & link dotfiles

Clone this repo into your home directory:

```bash
git clone git@github.com:kitsunekyo/dotfiles.git ~/.dotfiles
```

Then run `stow` from inside the repo to symlink everything into `~`:

```bash
cd ~/.dotfiles
stow .
# if stow warns about existing files in .config use this
# stow . --adopt && git restore .
```

---

### 5. Install mise-managed runtimes

`mise` replaces nvm, rustup, etc. with a single unified tool. After linking the dotfiles, install all runtimes defined in `~/.config/mise/config.toml`:

```bash
mise install
```

This installs:

| Runtime / Tool | Version |
|---------------|---------|
| `node` | LTS |
| `go` | latest |
| `rust` | latest |
| `pnpm` | 10.13.1 |
| `fzf` | latest |

See the [mise docs](https://mise.jdx.dev) for more.

