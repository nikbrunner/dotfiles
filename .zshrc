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

# Path Exports ===========================================================
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.scripts:$PATH
export PATH=$HOME/.scripts/git:$PATH
export PATH=/usr/bin/python:$PATH
export PATH=/usr/bin/python3:$PATH


# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# BikeCenter IPs
# Office BC
export BCO=10.10.2.110

# HOme BC (Tablet)
export BCT=192.168.2.106

ZSH_THEME="bira"
# ZSH_THEME="spaceship"

plugins=(git zsh-vi-mode zsh-z)

source $ZSH/oh-my-zsh.sh

# Dotfiles =================================================================
alias df='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Basics =================================================================
alias list="ls -la | grep "^d" && ls -la | grep "^-" && ls -la | grep \"^l\""
alias ls="ls -a"

alias clr="clear"

alias ctags="`brew --prefix`/bin/ctags"

alias scratch="vim ~/Desktop/scratchpad.md"

# Edit Config Files ======================================================
EDITOR="nvim"

alias lg="lazygit"
alias ld="lazydocker"
alias nu="npm-upgrade"

CONFIG_PATH=$HOME/.config
TMUX_PATH=$HOME
NVIM_PATH="$CONFIG_PATH/nvim"
LVIM_PATH="$CONFIG_PATH/lvim"
KARABINER_PATH="$CONFIG_PATH/karabiner"
ALACRITTY_PATH=$CONFIG_PATH/alacritty
KITTY_PATH=$CONFIG_PATH/kitty

alias config="$EDITOR ~/.config"
alias nvimconfig="$EDITOR $NVIM_PATH ."
alias lvimconfig="$EDITOR $LVIM_PATH ."
alias zshconfig="$EDITOR ~/.zshrc"
alias tmuxconfig="$EDITOR $TMUX_PATH/.tmux.conf"
alias alaconfig="$EDITOR $ALACRITTY_PATH/alacritty.yml"
alias kittyconfig="$EDITOR $KITTY_PATH/kitty.conf"
alias karaconfig="$EDITOR $KARABINER_PATH/karabiner.json"

# Path Declaration =======================================================
DOCUMENTS_PATH="$HOME/Documents"
DEV_PATH="$DOCUMENTS_PATH/dev"
REPOSITORIES_PATH="$DEV_PATH/repositories"
DCD_REPOSITORIES_PATH="$REPOSITORIES_PATH/dcd"
OWN_REPOSITORIES_PATH="$REPOSITORIES_PATH/own"
NOTES_PATH="$OWN_REPOSITORIES_PATH/notes"

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
alias sonder="cd $OWN_REPOSITORIES_PATH/sonderhaus"
alias dn="cd $OWN_REPOSITORIES_PATH/dotnotes"

# DCD ====================================================================
alias dcd="cd $DCD_REPOSITORIES_PATH"
alias bctd="$EDITOR $HOME/Documents/dev/ticket-draft.md"
alias dcd-notes="cd $DCD_REPOSITORIES_PATH/dcd-notes"
alias bch="cd $DCD_REPOSITORIES_PATH/bc-homepage && nvm use && clear"
alias bcc="cd $DCD_REPOSITORIES_PATH/bc-desktop-client && nvm use && clear"
alias bct="cd $DCD_REPOSITORIES_PATH/bc-desktop-tools"
alias bcs="cd $DCD_REPOSITORIES_PATH/bc-business-scripts"

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
