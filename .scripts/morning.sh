#!/bin/bash
echo "Good Morning Nik!"

# Update Homebrew
echo "::: Updating Homebrew..."
brew update
brew upgrade

# Update dotfiles
echo "::: Pushing current state of dotfiles-apple..."
alias df='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
df commit -a -m \"Updates\" && df push

# Update vim config
echo "::: Pushing current state of neovim config..."
NVIM_PATH="$HOME/.config/nvim"
git -C $NVIM_PATH commit -a -m \"Updates\" && git -C $NVIM_PATH push

#  Update stoic theme
echo "::: Updating Obsidian Stoic Theme"
sh $HOME/.scripts/updateStoicTheme.sh

