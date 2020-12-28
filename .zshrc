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

# Basics =================================================================
alias list="ls -la | grep "^d" && ls -la | grep "^-" && ls -la | grep \"^l\""
alias clr="clear"

# Dotfiles ===============================================================
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias dotfiles-push="dotfiles commit -a -m \"Updates\" && dotfiles push"

# Edit Config Files ======================================================
EDITOR="nvim"
SCIM="scim"
NVIM_PATH="~/.config/nvim"
TMUX_PATH="~"
alias vim="nvim"
alias vimconfig="$EDITOR $NVIM_PATH/init.vim"
alias zshconfig="$EDITOR ~/.zshrc"
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"
alias npmconfig="$EDITOR ~/.npmrc"
alias tmuxconfig="$EDITOR $TMUX_PATH/.tmux.conf"

# Path Declaration =======================================================
DOCUMENTS_PATH="$HOME/Documents"
NOTES_PATH="$DOCUMENTS_PATH/notes"
DEV_PATH="$DOCUMENTS_PATH/dev"
REPOSITORIES_PATH="$DEV_PATH/repositories"
DCD_REPOSITORIES_PATH="$DEV_PATH/dcd"
OWN_REPOSITORIES_PATH="$DEV_PATH/own"

# Navigation =============================================================
alias home="cd $HOME"
alias docs="cd $DOCUMENTS_PATH"
alias dev="cd $DEV_PATH"
alias notes="cd $NOTES_PATH"
alias projects="cd $PROJECTS_PATH"
alias own="cd $OWN_PROJECTS_PATH"
alias courses="cd $COURSE_PROJECTS_PATH"
alias work="cd $WORK_PROJECTS_PATH"

# DCD ====================================================================
alias dcd="cd $DCD_PROJECTS_PATH"
alias bc-website="cd $DCD_PROJECTS_PATH/bc-homepage"
alias bc-client="cd $DCD_PROJECTS_PATH/bc-desktop-client"
alias bc-tools="cd $DCD_PROJECTS_PATH/bc-desktop-tools"
alias bc-bpc="cd $DCD_PROJECTS_PATH/bc-tools-bikepricecalculator"

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

# fzf ====================================================================
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --no-ignore-vcs'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
alias fzfi='rg --files --hidden --follow --no-ignore-vcs -g "!{node_modules,.git}" | fzf`'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
