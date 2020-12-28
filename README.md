# dotfiles [Apple]

Save-place for my Apple dotfiles.

Workflow taken and quoted from [here](https://www.youtube.com/watch?v=tBoLDpTWVOM)

> I've been looking for a better way to manage my dotfiles. My old method involved moving all of my dotfiles into their own directory and then symlinking each one fo them back into the directory structure. What a headache!
>
> Using git bare repositories, there is no more moving files into an initialized git repository and then creating symlinks. Now, I just add, commit and then push. Done.
>
> Want to make your own git bare repository? First, make a directory for your new git bare repository (I created one called "dotfiles" but you can name it whatever).
>
> Then I entered the following in the terminal:

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
