# dotfiles [Apple]

Save-place for my Apple dotfiles.

Workflow taken and quoted from [here](https://www.youtube.com/watch?v=tBoLDpTWVOM)

```bash
# Create folder for bare Git Repository
mkdir $HOME/dotfiles

# Initialize bare Git Repository
git init --bare $HOME/dotfiles

# add this alias to your .zshrc or .bashrc
# Dotfiles ===============================================================
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias dotfiles-push="dotfiles commit -a -m \"Updates\" && dotfiles push"

# Reload shell
zsh

# hide untracked files
dotfiles config --local status.showUntrackedFiles no

# Add remote repo
dotfiles remote add origin git@github.com:nikbrunner/dotfiles-apple.git

# Pull from remote
dotfiles pull origin master

# Basic usage example:
dotfiles add /path/to/file
dotfiles-push
```
