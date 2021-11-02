# dotfiles

## Setup

### `.dotfiles` Repository
```bash
# Create folder for bare Git Repository
mkdir $HOME/.dotfiles

# Initialize bare Git Repository
git init --bare $HOME/.dotfiles

# Add this temporary to the session. 
# For permanent use it is saved in the `.zshrc`
alias df='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Hide untracked files
df config --local status.showUntrackedFiles no

# Add remote repo
df remote add origin git@github.com:nikbrunner/dotfiles.git

# Initial pull from remote 
df pull origin master

# Basic usage example:
push.sh --dots
```

### Oh my zsh
#### Oh my zsh
```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

#### `zsh-vi-mode`
```sh
git clone https://github.com/jeffreytse/zsh-vi-mode $ZSH/custom/plugins/zsh-vi-mode
```

#### `zsh-z`
```sh
git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z
```

## NeoVim

For my [NeoVim](https://github.com/nikbrunner/nibru.nvim) setup I have a dedicated repository, which is declared in this repository as a submodule, **but** needs to be cloned seperately.

## Todo
- [x] Move LazyGit Config into `.config` 

### Scripts
- [ ] [Better Automation for Dots](https://stackoverflow.com/questions/3258243/check-if-pull-needed-in-git)

### README
- [x] Update Setup
- [x] Clean Up
- [ ] Write out shortcut philosopy

### ZSH
- [ ] Path auto-completion
- [ ] Clean up `.zshrc`
