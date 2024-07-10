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

## Homebrew

Run `brew bundle` from the location folder of the `Brewfile` to install apps

## NeoVim

For my [NeoVim](https://github.com/nikbrunner/nibru.nvim) setup I have a dedicated repository, which is declared in this repository as a submodule, **but** needs to be cloned seperately.

> Also remember to install `ripgrep` and `fzf`

## disable accented character picker

macos, by default, on long-hold of a keyboard key, will show the character picker rather than repeat the character
until key release. NOTE: you have to logout/log-back-in to the mac for this to take effect:

`defaults write -g ApplePressAndHoldEnabled -bool false`

## Turn off "rearrange spaces"

- System Preferences:
  - Desktop & Dock
    - Scroll to "Mission Control"
      - turn off "Automatically rearrange Spaces based on most recent use"
