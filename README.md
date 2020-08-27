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

# add this alias to .zshrc or .bashrc
alias c='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# Reload shell
zsh

# hide untracked files
c config --local status.showUntrackedFiles no

# Add remote repo
c remote add origin <repoUrl>

# Basic usage example:
c add /path/to/file
c commit -m "A short message"
c push

# In .zshrc i set up aliases to shorten config to c
...

alias c='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias cl="c log --oneline"
alias cs="c status"
alias ca="c add"

...
```
