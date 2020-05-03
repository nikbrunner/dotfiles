# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/usr/local/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="/Users/nikolaus.brunner/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Alias
# Git dotfiles bare repository
alias c='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias cl="c log --oneline"
alias cs="c status"
alias ca="c add"
alias cau="c add -u"
alias ccm="c commit -m"
alias ccam="c commit -a -m"
alias cpush="c push"
alias cupdate="ccam \"Updates\" && cpush"

# Git commands
alias gs="git status"
alias gpush="git push"
alias gpushu="git push -u"
alias gpull="git pull"
alias gfa="git fetch --all"
alias gb="git branch"
alias gbl="git branch -l"
alias gcob="git checkout -b"
alias gco="git checkout"
alias gbd="git branch -d"
alias ga="git add"
alias gau="git add -u"
alias ga.="git add ."
alias grrc="git rm -r --cached"
alias grrc.="git rm -r --cached ."
alias gcm="git commit -m"
alias gcam="git commit -a -m"
alias gcane="git commit --amend --no-edit"
alias gra="git remote add"
alias grao="git remote add origin"
alias grr="git remote remove"
alias grv="git remote -v"
alias gl="git log --oneline"
alias greb="git rebase"
alias grebi="git rebase -i"

# Pathes
alias EDITOR="webstorm"

alias home="cd ~"
alias zshconfig="EDITOR ~/.zshrc"
alias ohmyzsh="EDITOR ~/.oh-my-zsh"
alias dev="cd /Users/nikolaus.brunner/Documents/dev"
alias projects="cd /Users/nikolaus.brunner/Documents/dev/projects"
alias courses="/Users/nikolaus.brunner/Documents/dev/training/courses/"
alias trainP="/Users/nikolaus.brunner/Documents/dev/training/training-projects/"

# Diva
alias npmconfig=" code ~/.npmrc"
alias diva="cd /Users/nikolaus.brunner/Documents/dev/employers/diva-e"
alias divaP="cd /Users/nikolaus.brunner/Documents/dev/employers/diva-e/projects"
alias divagram="cd /Users/nikolaus.brunner/Documents/dev/employers/diva-e/projects/divagram/frontend/repo"
alias baywa="cd /Users/nikolaus.brunner/Documents/dev/employers/diva-e/projects/baywa/repo/frontend"
alias pspc="cd /Users/nikolaus.brunner/Documents/dev/employers/diva-e/projects/postbank/calculators/repo"

# Basics
alias clr="clear"

# Xclip
alias copy="xclip -selection clipboard" # copy to system wide clipboard (register +)
alias paste="xclip -o -selection clipboard" # paste from system wide clipboard (equivalent to `v -selection clipboard`)
alias getdir="pwd | copy"
alias godir="cd \`paste\`"

# Setup Repo
alias srs="cp /Users/nikolaus.brunner/Documents/dev/resources/scripts/setup-repo.sh ."

# Stillness
alias stillness="cp -r /Users/nikolaus.brunner/Documents/dev/projects/stillness/repo/stillness ."

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
