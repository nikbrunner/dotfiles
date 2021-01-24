#!/bin/bash
echo "Good Morning Nik!"

# Update Homebrew
echo "Updating Homebrew..."
brew update

# Update dotfiles
# TODO Import alias?
echo "Pushing current state of dotfiles-apple..."
alias df='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dfp="df commit -a -m \"Updates\" && df push"
dfp

#  Update stoic theme
sh ~/Documents/notes/getStoicTheme.sh

