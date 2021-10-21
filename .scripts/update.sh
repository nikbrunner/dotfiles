#!/bin/bash

GREEN='\033[0;32m'
ORANGE='\033[0;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}Good Morning Nik!${NC}"
# Update vim config
function updateVimDotfiles () {
  echo -e "${ORANGE}::: Updating NeoVim dotfiles...${NC}"

  NVIM_PATH="$HOME/.config/nvim"

  git -C $NVIM_PATH pull --rebase
}


# Update dotfiles
function updateDotfiles () {
  echo -e "${ORANGE}::: Updating Home-Directory dotfiles...${NC}"

  function homeDirGit () {
    /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $1
  } 

  homeDirGit stash
  homeDirGit pull --rebase
  homeDirGit stash pop
}

# Update Homebrew
function updateHomebrew () {
  echo -e "${ORANGE}::: Updating Homebrew...${NC}"
  brew update
  brew outdated
}

function updateFull () {
  updateVimDotfiles
  updateDotfiles
  updateHomebrew
}

case $1 in
  "--dots")
    updateDotfiles
    ;;

  "--nv")
    updateVimDotfiles
    ;;

  "--brew")
    updateHomebrew
    ;;

  "--full")
    updateFull
    ;;

  *)
    echo "Unknown argument \"$1\""
    ;;
esac

