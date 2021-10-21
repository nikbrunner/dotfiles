#!/bin/bash

GREEN='\033[0;32m'
ORANGE='\033[0;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}Good Morning Nik!${NC}"
# Update vim config
function pushNvDots () {
  echo -e "${ORANGE}::: Pushing NeoVim dotfiles...${NC}"
  NVIM_PATH="$HOME/.config/nvim"
  timestamp=$(date =%s)

  git -C $NVIM_PATH add .
  git -C $NVIM_PATH commit -a -m "Updates @ $timestamp" && git -C $NVIM_PATH push
}

# Update dotfiles
function pushDots () {
  echo -e "${ORANGE}::: Pushing Home-Directory dotfiles...${NC}"

  function homeDirGit () {
    /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $1
  }

  timestamp=$(date =%s)


  homeDirGit "commit -a -m Updates"
  homeDirGit "push"
}

function updateFull () {
  pushNvDots
  pushDots
}

case $1 in
  "--dots")
    pushDots
    ;;

  "--nv")
    pushNvDots
    ;;

  "--full")
    updateFull
    ;;

  *)
    echo "Unknown argument \"$1\""
    ;;
esac

