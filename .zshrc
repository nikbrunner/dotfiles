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

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Path Declaration =======================================================
# APPLICATIONS_PATH="$HOME/Applications"
DOCUMENTS_PATH="$HOME/Documents"
BRAIN_PATH="$DOCUMENTS_PATH/brain"
# MUSIC_PATH="$DOCUMENTS_PATH/music"
DEV_PATH="$DOCUMENTS_PATH/dev"
PROJECTS_PATH="$DEV_PATH/projects"
SCRIPTS_PATH="$DEV_PATH/resources/scripts"
OWN_PROJECTS_PATH="$PROJECTS_PATH/own"
COURSE_PROJECTS_PATH="$PROJECTS_PATH/courses"
WORK_PROJECTS_PATH="$PROJECTS_PATH/work"

# Aliases ================================================================

# Basics =================================================================
alias list="ls -la | grep "^d" && ls -la | grep "^-" && ls -la | grep \"^l\""
alias clr="clear"

# Git dotfiles ===========================================================
alias c="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
alias cl="c log --oneline"
alias cs="c status"
alias ca="c add"
alias cau="c add -u"
alias ccm="c commit -m"
alias ccam="c commit -a -m"
alias cpush="c push"
alias cupdate="ccam \"Updates\" && cpush"

# BRAIN ==================================================================
alias brainE="cd $BRAIN_PATH && nvim ."
alias b="/usr/bin/git --git-dir=$BRAIN_PATH/.git --work-tree=$BRAIN_PATH"
alias bl="b log --oneline"
alias bs="b status"
alias ba="b add"
alias ba.="b add $BRAIN_PATH/."
alias bau="b add -u"
alias bcm="b commit -m"
alias bcam="b commit -a -m"
alias bpush="b push"
alias bupdate="ba. && bcm \"Updates\" && bpush"

# Git commands ===========================================================
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
alias xupdate="cupdate && bupdate"

# Edit Config Files ======================================================
EDITOR="nvim"
SCIM="scim"
NVIM_PATH="~/.config/nvim"
TMUX_PATH="~"
alias vim="nvim"
alias v="nvim"
alias vimconfig="$EDITOR $NVIM_PATH/init.vim"
alias zshconfig="$EDITOR ~/.zshrc"
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"
alias npmconfig="$EDITOR ~/.npmrc"
alias tmuxconfig="$EDITOR $TMUX_PATH/.tmux.conf"
alias food="$SCIM $BRAIN_PATH/household/food-purchases.csv"

# Navigation =============================================================
alias home="cd $HOME"
alias docs="cd $DOCUMENTS_PATH"
alias music="cd $MUSIC_PATH"
alias brain="cd $BRAIN_PATH"
alias dev="cd $DEV_PATH"
alias projects="cd $PROJECTS_PATH"
alias own="cd $OWN_PROJECTS_PATH"
alias courses="cd $COURSE_PROJECTS_PATH"
alias work="cd $WORK_PROJECTS_PATH"

# diva-e =================================================================
DIVAE_PATH="$WORK_PROJECTS_PATH/diva-e"
alias divae="cd $DIVAE_PATH"
alias divagram="cd $DIVAE_PATH/divagram"
alias divagramF="cd $DIVAE_PATH/divagram/frontend/repo"
alias divagramB="cd $DIVAE_PATH/divagram/backend/repo"
alias baywa="cd $DIVAE_PATH/baywa/repo/frontend"

# File Explorer ==========================================================
FILE_EXPLORER="vifm"
alias e-home="$FILE_EXPLORER $HOME"
alias e-docs="$FILE_EXPLORER $DOCUMENTS_PATH $BRAIN_PATH"
alias e-brain="$FILE_EXPLORER $BRAIN_PATH $BRAIN_PATH"
alias e-dev="$FILE_EXPLORER $DEV_PATH $DEV_PATH"
alias e-projects="$FILE_EXPLORER $PROJECTS_PATH $PROJECTS_PATH"
alias e-own="$FILE_EXPLORER $OWN_PROJECTS_PATH $OWN_PROJECTS_PATH"
alias e-courses="$FILE_EXPLORER $COURSE_PROJECTS_PATH $OWN_PROJECTS_PATH"
alias e-work="$FILE_EXPLORER $WORK_PROJECTS_PATH $WORK_PROJECTS_PATH"

# Spotify ================================================================
alias spt="$APPLICATIONS_PATH/./spt"

# Scripts ================================================================
alias srs="cp $SCRIPTS_PATH/setup-repo.sh ."

# Path Exports ===========================================================
# export PATH=/opt/firefox/firefox:$PATH
export PATH=/usr/bin/python:$PATH
export PATH=/usr/bin/python3:$PATH
# export PATH=/usr/bin/snap:$PATH

# Node ===================================================================
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# fzf ====================================================================
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --no-ignore-vcs'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
alias fzfi='rg --files --hidden --follow --no-ignore-vcs -g "!{node_modules,.git}" | fzf`'
