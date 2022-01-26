
#### FIG ENV VARIABLES ####
# Please make sure this block is at the start of this file.
[ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh
#### END FIG ENV VARIABLES ####





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


# ZSH_THEME="robbyrussell"
ZSH_THEME="bira"
# ZSH_THEME="spaceship"
# ZSH_THEME="amuse"

plugins=(git zsh-vi-mode zsh-z)

source $ZSH/oh-my-zsh.sh

# Edit Config Files ======================================================
EDITOR="nvim"

# Dotfiles =================================================================
alias df='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Basics =================================================================
alias list="ls -la | grep "^d" && ls -la | grep "^-" && ls -la | grep \"^l\""
alias ls="ls -a"
alias clr="clear"
alias scratch="$EDITOR $HOME/scratchpad.md"
alias archi="echo sys-arch: $(arch) ::: node-arch: $(node -p process.arch)"
alias clearpacker="rm -rf ~/.local/share/nvim/site && rm -rf ~/.config/nvim/plugin"

alias lg="lazygit"
alias ld="lazydocker"
alias ln="lazynpm"
alias nu="npm-upgrade"
alias nv="nvim"

# this is sadly needed somehow for ssh with kitty
alias ssh="kitty +kitten ssh"

CONFIG_PATH="$HOME/.config"
NVIM_PATH="$CONFIG_PATH/nvim"
KITTY_PATH="$CONFIG_PATH/kitty"

alias conf="$EDITOR ~/.config"
alias nvconf="$EDITOR $NVIM_PATH ."
alias zshconf="$EDITOR ~/.zshrc"
alias kittyconf="$EDITOR $KITTY_PATH/kitty.conf"

# Digital DealerCenter
# Office BC
export BCO=192.168.2.140
alias HBCO="HOST=$BCO"

# Home BC
export BCH=192.168.2.115
alias HBCH="HOST=$BCH"

# Home BC (Tablet)
export BCT=192.168.2.106
alias HBCT="HOST=$BCT"

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
alias bch="cd $DCD_REPOSITORIES_PATH/bc-homepage && clear"
alias bcc="cd $DCD_REPOSITORIES_PATH/bc-desktop-client && clear"
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
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/bit bit
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/bit bit






#### FIG ENV VARIABLES ####
# Please make sure this block is at the end of this file.
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
#### END FIG ENV VARIABLES ####
