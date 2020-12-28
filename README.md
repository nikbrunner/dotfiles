# dotfiles [Apple]

Save-place for my Apple dotfiles.

```bash
# Create folder for bare Git Repository
mkdir $HOME/.dotfiles

# Initialize bare Git Repository
git init --bare $HOME/.dotfiles

# add this alias to your .zshrc or .bashrc
# Dotfiles ===============================================================
alias df='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dfp="df commit -a -m \"Updates\" && df push"

# Reload shell
zsh

# hide untracked files
df config --local status.showUntrackedFiles no

# Add remote repo
df remote add origin git@github.com:nikbrunner/df-apple.git

# Pull from remote
df pull origin master

# Basic usage example:
df add /path/to/file
dfp
```
