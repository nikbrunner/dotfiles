#!/bin/bash

GREEN='\033[0;32m'
NC='\033[0m' # No Color
# printf "I ${RED}love${NC} Stack Overflow\n"

echo "${GREEN}Good Morning Nik!${NC}"

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

