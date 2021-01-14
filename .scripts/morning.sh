#!/bin/bash
echo "Good Morning Nik!"

echo "Updating Homebrew..."
brew update

echo "Pushing current state of dotfiles-apple..."
alias df='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dfp="df commit -a -m \"Updates\" && df push"
dfp
