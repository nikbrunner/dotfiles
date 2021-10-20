# dotfiles

## Setup

```bash
# Create folder for bare Git Repository
mkdir $HOME/.dotfiles

# Initialize bare Git Repository
git init --bare $HOME/.dotfiles

# add this alias to your .zshrc or .bashrc
# Dotfiles ===============================================================
alias df='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Reload shell
zsh

# hide untracked files
df config --local status.showUntrackedFiles no

# Add remote repo
df remote add origin git@github.com:nikbrunner/dotfiles.git

# Pull from remote
df pull origin master

# Initial pull from remote 
df pull origin master

# Basic usage example:
update.sh --dots
```

### NeoVim

For my [NeoVim](https://github.com/nikbrunner/nibru.nvim) setup I now have a dedicated repository, which is declared in this repository as a submodule.

## Shortcut philosophy

My goal is to have dedicated layers for dedicated areas of responsibility, while keeping the default shortcuts from the OS untouched as far as sensible.

### Hyper / Super

The <kbd>Hyper/Super</kbd> is interchangable depending on the Operating System

#### <kbd>Hyper</kbd> + <kbd>1 - 0</kbd> / <kbd>F1 - F12</kbd> 

Control-layer for launching and hiding Apps with (currently) [HotKey App](https://codenuts.de/en/posts/hotkey/). This should be handled, if possible, with [SKHD](https://github.com/koekeishiya/skhd) in the future. 

#### <kbd>Hyper</kbd> + <kbd>A - Z</kbd> 
Controlling the tree for [YabaiWM](https://github.com/koekeishiya/yabai).

- Layout tree
- Rotate tree
- Toggle state of windows
- Swap and Warp windows

#### <kbd>Shift</kbd> + <kbd>Alt</kbd> + <kbd>A - Z</kbd>
Controlling the branches for [YabaiWM](https://github.com/koekeishiya/yabai).

- Resize window
- Move window

## Todo
- [x] Move LazyGit Config into `.config` 

### README
- [ ] Write out shortcut philosopy
- [ ] Update Setup
- [ ] Clean Up

### NeoVim 
- [Look here](~/.config/nvim/TODO.md)

### ZSH
- [ ] Path auto-completion
- [ ] Clean up `.zshrc`
