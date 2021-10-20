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

## NeoVim

For my [NeoVim](https://github.com/nikbrunner/nibru.nvim) setup I have a dedicated repository, which is declared in this repository as a submodule.

## Todo
- [x] Move LazyGit Config into `.config` 

### README
- [ ] Write out shortcut philosopy
- [ ] Update Setup
- [ ] Clean Up

### ZSH
- [ ] Path auto-completion
- [ ] Clean up `.zshrc`
