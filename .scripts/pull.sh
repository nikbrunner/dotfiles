#!/bin/bash

GREEN='\033[0;32m'
ORANGE='\033[0;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}Good Morning Nik!${NC}"
# Update vim config
function pullNv () {
  echo -e "${ORANGE}::: Pulling NeoVim dotfiles...${NC}"

  NVIM_PATH="$HOME/.config/nvim"

  git -C $NVIM_PATH stash
  git -C $NVIM_PATH pull --rebase
  git -C $NVIM_PATH stash pop
}


# Update dotfiles
function  pullDots() {
  echo -e "${ORANGE}::: Pulling Home-Directory dotfiles...${NC}"

  function homeDirGit () {
    /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $1
  } 

  homeDirGit stash
  homeDirGit pull --rebase
  homeDirGit stash pop
}

# Update Homebrew
function pullHomeBrew () {
  echo -e "${ORANGE}::: Pulling Homebrew...${NC}"
  brew update
  brew outdated
}

function updateFull () {
  pullNv
  pullDots
  pullHomeBrew
}

case $1 in
  "--dots")
    pullDots
    ;;

  "--nv")
    pullNv
    ;;

  "--brew")
    pullHomeBrew
    ;;

  "--full")
    updateFull
    ;;

  *)
    echo "Unknown argument \"$1\""
    ;;
esac

