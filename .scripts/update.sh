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
    git -C $NVIM_PATH add .
    git -C $NVIM_PATH commit -a -m \"Updates\" && git -C $NVIM_PATH push
}

function homeDirGit () {
    /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $1
} 

# Update dotfiles
function updateDotfiles () {
    echo -e "${ORANGE}::: Updating Home-Directory dotfiles...${NC}"
    # Update configured submodules 
    # TODO This is a problem currently, since this always puts my submodule on a detached HEAD state
    # homeDirGit "submodule update"
    homeDirGit "pull --rebase"
    homeDirGit "commit -a -m \"Updates\""
    homeDirGit "push"
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

