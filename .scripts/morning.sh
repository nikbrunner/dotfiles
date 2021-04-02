#!/bin/bash

GREEN='\033[0;32m'
ORANGE='\033[0;33m'
NC='\033[0m' # No Color

echo "${GREEN}Good Morning Nik!${NC}"

# Update Homebrew
echo "${ORANGE}::: Updating Homebrew...${NC}"
brew update
brew upgrade

# Update vim config
echo "${ORANGE}::: Updating NeoVim config...${NC}"
NVIM_PATH="$HOME/.config/nvim"
git -C $NVIM_PATH commit -a -m \"Updates\" && git -C $NVIM_PATH push

# Update dotfiles
echo "${ORANGE}::: Updating dotfiles...${NC}"
alias df='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
# df submodule update
df commit -a -m \"Updates\" && df push

#  Update stoic theme
echo "${ORANGE}::: Updating Obsidian Stoic Theme${NC}"
sh $HOME/.scripts/updateStoicTheme.sh

