# ________________________/\\\______________________________________
#  _______________________\/\\\______________________________________
#   _________________/\\\__\/\\\______________________________________
#    __/\\/\\\\\\____\///___\/\\\__________/\\/\\\\\\\____/\\\____/\\\_
#     _\/\\\////\\\____/\\\__\/\\\\\\\\\___\/\\\/////\\\__\/\\\___\/\\\_
#      _\/\\\__\//\\\__\/\\\__\/\\\////\\\__\/\\\___\///___\/\\\___\/\\\_
#       _\/\\\___\/\\\__\/\\\__\/\\\__\/\\\__\/\\\__________\/\\\___\/\\\_
#        _\/\\\___\/\\\__\/\\\__\/\\\\\\\\\___\/\\\__________\//\\\\\\\\\__
#         _\///____\///___\///___\/////////____\///____________\/////////___
#
# These are my dotfiles
# System: MacOS
# Website: https://nibru.dev
# E-Mail: nikolaus.brunner@protonmail.ch
# Repository: https://github.com/nikbrunner/dotfiles-apple

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

# Aliases ===================
# Commands
alias list="ls -la | grep "^d" && ls -la | grep "^-" && ls -la | grep \"^l\""

# Git dotfiles bare repository
alias c="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
alias cl="c log --oneline"
alias cs="c status"
alias ca="c add"
alias cau="c add -u"
alias ccm="c commit -m"
alias ccam="c commit -a -m"
alias cpush="c push"
alias cupdate="ccam \"Updates\" && cpush"

# Git notes
NOTES_PATH="$HOME/Documents/notes"
alias notes="cd $NOTES_PATH"
alias gn="/usr/bin/git --git-dir=$NOTES_PATH/.git --work-tree=$NOTES_PATH"
alias gnl="gn log --oneline"
alias gns="gn status"
alias gna="gn add"
alias gna.="gn add ."
alias gnau="gn add -u"
alias gncm="gn commit -m"
alias gncam="gn commit -a -m"
alias gnpush="gn push"
alias gnupdate="gna. && gncm \"Updates\" && gnpush"

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

# Combined update
alias xupdate="cupdate && gnupdates"

# Config Files
EDITOR="code"
alias zshconfig="$EDITOR ~/.zshrc"
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"
alias npmconfig="$EDITOR ~/.npmrc"

# Navigation
DEV_PATH="$HOME/Documents/dev"
PROJECTS_PATH="$DEV_PATH/projects"
OWN_PROJECTS_PATH="$PROJECTS_PATH/own"
COURSE_PROJECTS_PATH="$PROJECTS_PATH/courses"
WORK_PROJECTS_PATH="$PROJECTS_PATH/work"
alias home="cd $HOME"
alias dev="cd $DEV_PATH"
alias projects="cd $PROJECTS_PATH"
alias own="cd $OWN_PROJECTS_PATH"
alias courses="cd $COURSE_PROJECTS_PATH"
alias work="cd $WORK_PROJECTS_PATH"

# diva-e
DIVAE_PATH="$WORK_PROJECTS_PATH/diva-e"
alias divae="cd $DIVAE_PATH"
alias divagram="cd $DIVAE_PATH/divagram/frontend/repo"
alias baywa="cd $DIVAE_PATH/baywa/repo"

# Basics
alias clr="clear"

# Xclip
alias copy="xclip -selection clipboard"     # copy to system wide clipboard (register +)
alias paste="xclip -o -selection clipboard" # paste from system wide clipboard (equivalent to `v -selection clipboard`)
alias getdir="pwd | copy"
alias godir="cd \`paste\`"

# Copy setup-repo script to current directory
RESOURCES_PATH="$DEV_PATH/resources"
SCRIPTS_PATH="$RESOURCES_PATH/scripts"
alias srs="cp $RESOURCES_PATH/setup-repo.sh ."

# Copy Stillness DSI files to current directory
alias stillness="cp -r $HOME/Documents/dev/projects/stillness/repo/stillness ."
alias stillness="cp -r $OWN_PROJECTS_PATH/stillness/repo/stillness/dsi ."

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
