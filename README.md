# dotfiles [Apple]

Save-place for my Apple dotfiles.

## Setup

```bash
# Create folder for bare Git Repository
mkdir $HOME/.dotfiles

# Initialize bare Git Repository
git init --bare $HOME/.dotfiles

# add this alias to your .zshrc or .bashrc
# Dotfiles ===============================================================
alias df='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dfp="df commit -a -m \"Updates\" && df push"

# Reload shell
zsh

# hide untracked files
df config --local status.showUntrackedFiles no

# Add remote repo
df remote add origin git@github.com:nikbrunner/df-apple.git

# Pull from remote
df pull origin master

# Basic usage example:
df add /path/to/file
dfp
```

### NeoVim

For my [NeoVim](https://github.com/nikbrunner/nibru.nvim) setup I now have a dedicated repository, which is declared in this repository as a submodule.

## Worfklow Tools

- Mission Control from MacOS
- [Karabiner Elements](https://karabiner-elements.pqrs.org/)
- [YabaiWM](https://github.com/koekeishiya/yabai)
- [SKHD](https://github.com/koekeishiya/skhd)
- [HotKey App](https://codenuts.de/en/posts/hotkey/)
- [Git Completion](https://oliverspryn.medium.com/adding-git-completion-to-zsh-60f3b0e7ffbc)
  - *Attention*: I put these files in `.config/.zsh/` instead of `.zsh/` like the author suggests
- [Delta](https://github.com/dandavison/delta)

## Shortcut philosophy

My goal is to have dedicated layers for dedicated areas of responsibility, while keeping the default shortcuts from the OS untouched as far as sensible.

### Hyper

With [Karabiner Elements](https://karabiner-elements.pqrs.org/) I set up a **Hyper**-key which is just an alias for smashing all modifier keys together. (`Ctrl`, `Shift`, `Option`, `Cmd`).

This creates a (almost) whole new layer of unused space of shortcuts. There are exeptions, which we also manage and disable via **Karabiner**.

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
- [ ] Move LazyGit Config into `.config` 

### README
- [ ] Write out shortcut philosopy
- [ ] Update Setup
- [ ] Clean Up

### NeoVim 
- [Look here](~/.config/nvim/TODO.md)

### ZSH
- [ ] Path auto-completion
- [ ] Clean up `.zshrc`
