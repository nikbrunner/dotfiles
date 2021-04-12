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

export PATH="$HOME/.scripts:$PATH"

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

# Dotfiles =================================================================
alias df='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Basics =================================================================
alias list="ls -la | grep "^d" && ls -la | grep "^-" && ls -la | grep \"^l\""
alias ls="ls -a"

alias clr="clear"

alias ctags="`brew --prefix`/bin/ctags"

# Edit Config Files ======================================================
CONFIG_PATH=$HOME/.config
EDITOR="nvim"
TMUX_PATH=$HOME
NVIM_PATH="$CONFIG_PATH/nvim"
KARABINER_PATH="$CONFIG_PATH/karabiner"
ALACRITTY_PATH=$CONFIG_PATH/alacritty
KITTY_PATH=$CONFIG_PATH/kitty

alias v="nvim"
alias vim="nvim"
alias lg="lazygit"
alias vimconfig="$EDITOR $NVIM_PATH ."
alias zshconfig="$EDITOR ~/.zshrc"
alias tmuxconfig="$EDITOR $TMUX_PATH/.tmux.conf"
alias alaconfig="$EDITOR $ALACRITTY_PATH/alacritty.yml"
alias kittyconfig="$EDITOR $KITTY_PATH/kitty.conf"
alias karaconfig="$EDITOR $KARABINER_PATH/karabiner.json"

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
alias repos="cd $DEV_PATH/repositories"
alias notes="cd $NOTES_PATH"
alias own="cd $OWN_REPOSITORIES_PATH"

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

# neovim-remote ==========================================================
if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
    alias nvim=nvr -cc split --remote-wait +'set bufhidden=wipe'
fi

if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
    export VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
    export EDITOR="nvr -cc split --remote-wait +'set bufhidden=wipe'"
else
    export VISUAL="nvim"
    export EDITOR="nvim"
fi

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.config/.zsh/git-completion.bash
fpath=(~/.config/.zsh $fpath)

autoload -Uz compinit && compinit

# Fix auto-completion bug (https://github.com/ohmyzsh/ohmyzsh/issues/4632)
LC_ALL="en_US.UTF-8"
