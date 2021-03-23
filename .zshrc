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
plugins=(git zsh-vi-mode)

source $ZSH/oh-my-zsh.sh


# Basics =================================================================
alias list="ls -la | grep "^d" && ls -la | grep "^-" && ls -la | grep \"^l\""
alias clr="clear"

# Dotfiles ===============================================================
alias df='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
## dotfiles-push / dfp
alias dfp="df commit -a -m \"Updates\" && df push"

alias ls="ls -a"

# Edit Config Files ======================================================
CONFIG_PATH=$HOME/.config
EDITOR="nvim"
TMUX_PATH=$HOME
NVIM_PATH="$CONFIG_PATH/nvim"
ALACRITTY_PATH=$CONFIG_PATH/alacritty
alias v="nvim"
alias vim="nvim"
alias dfconfig="$EDITOR -S ~/df.vim"
alias vimconfig="$EDITOR $NVIM_PATH"
alias zshconfig="$EDITOR ~/.zshrc"
alias tmuxconfig="$EDITOR $TMUX_PATH/.tmux.conf"
alias alaconfig="$EDITOR $ALACRITTY_PATH/alacritty.yml"

# Path Declaration =======================================================
DOCUMENTS_PATH="$HOME/Documents"
NOTES_PATH="/Users/nibru/Library/Mobile\ Documents/iCloud~md~obsidian/Documents"
DEV_PATH="$DOCUMENTS_PATH/dev"
REPOSITORIES_PATH="$DEV_PATH/repositories"
DCD_REPOSITORIES_PATH="$REPOSITORIES_PATH/dcd"
OWN_REPOSITORIES_PATH="$REPOSITORIES_PATH/own"

# Navigation =============================================================
alias home="cd $HOME"
alias docs="cd $DOCUMENTS_PATH"
alias dev="cd $DEV_PATH"
alias notes="cd $NOTES_PATH"
alias own="cd $OWN_REPOSITORIES_PATH"

alias vim-notes="vim -S $NOTES_PATH/workspace.vim"

# Own Projects ============================================================
alias nd="cd $OWN_REPOSITORIES_PATH/nibru.dev"
alias ndn="cd $OWN_REPOSITORIES_PATH/nibru.dev-next"
alias vim-nd="vim -S $OWN_REPOSITORIES_PATH/nibru.dev/workspace.vim"
alias vim-ndn="vim -S $OWN_REPOSITORIES_PATH/nibru.dev-next/workspace.vim"

# DCD ====================================================================
alias td="$EDITOR $HOME/Documents/dev/ticket-draft.md"
alias dcd="cd $DCD_REPOSITORIES_PATH"
alias bc-homepage="cd $DCD_REPOSITORIES_PATH/bc-homepage"
alias bc-client="cd $DCD_REPOSITORIES_PATH/bc-desktop-client"
alias bc-tools="cd $DCD_REPOSITORIES_PATH/bc-desktop-tools"
alias bc-scripts="cd $DCD_REPOSITORIES_PATH/bc-business-scripts"
alias bc-bpc="cd $DCD_REPOSITORIES_PATH/bc-tools-bikepricecalculator"
alias bc-brandworld-bergamont="cd $DCD_REPOSITORIES_PATH/bc-brandworld-bergamont"

# Path Exports ===========================================================
export PATH=/usr/bin/python:$PATH
export PATH=/usr/bin/python3:$PATH

# Node ===================================================================
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# fzf ====================================================================
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --no-ignore-vcs'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
alias fzfi='rg --files --hidden --follow --no-ignore-vcs -g "!{node_modules,.git}" | fzf`'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export BAT_THEME="gruvbox"

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

# Scripts I want to have available globally
SCRIPTS_FOLDER="$HOME/.scripts";

ide () {
  sh "$SCRIPTS_FOLDER/ide.sh"
}

morning () {
  sh "$SCRIPTS_FOLDER/morning.sh"
}

update-stoic () {
  # sh "$SCRIPTS_FOLDER/"
}

# alias update-stoic="npm run dist && sh ~/Documents/notes/getStoicTheme.sh"
