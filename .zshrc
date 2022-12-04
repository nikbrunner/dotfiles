# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# HomeBrew
local brew_path="/opt/homebrew/bin"
local brew_opt_path="/opt/homebrew/opt"

# Path Exports ===========================================================
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.scripts:$PATH
export PATH=$HOME/.scripts/git:$PATH
export PATH=$HOME/Applications:$PATH
export PATH=/usr/bin/python:$PATH
export PATH=/usr/bin/python3:$PATH
export PATH=$HOME/.deno/bin:$PATH

export NVM_DIR=$HOME/.nvm
export PATH=${brew_path}:${PATH}
export PATH=${brew_opt_path}/python@3.10/bin/python3:$PATH

# NVM
[ -s "${brew_opt_path}/nvm/nvm.sh" ] && . "${brew_opt_path}/nvm/nvm.sh" 

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
# ZSH_THEME="bira"
# ZSH_THEME="nicoulaj"
# ZSH_THEME="amuse"
# plugins=(git zsh-vi-mode zsh-z)
plugins=(git zsh-z)

# Edit Config Files ======================================================
EDITOR="lvim"

# Dotfiles =================================================================
alias df='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dfu='df add -u'

# Basics =================================================================
alias list="ls -la | grep "^d" && ls -la | grep "^-" && ls -la | grep \"^l\""
alias ls="ls -a"
alias clr="clear"
alias scratch="$EDITOR $HOME/scratchpad.md"
alias clearpacker="rm -rf ~/.local/share/nvim/site && rm -rf ~/.config/nvim/plugin"

alias lg="lazygit"
alias nu="npm-upgrade"
alias tn="tmux new"
alias ta="tmux attach"
alias neovide="open -a Neovide"
alias j="z"

# Kitty
alias theme="kitty +kitten themes --reload-in=all "
alias themes="kitty +kitten themes"
alias ssh='env TERM=xterm-256color ssh' # allows kitty to work with ssh

CONFIG_PATH="$HOME/.config"
NVIM_PATH="$CONFIG_PATH/nvim"
KITTY_PATH="$CONFIG_PATH/kitty"

alias conf="$EDITOR ~/.config"
alias nvconf="$EDITOR $NVIM_PATH ."
alias zshconf="$EDITOR ~/.zshrc"
alias kittyconf="$EDITOR $KITTY_PATH/kitty.conf"
alias lgconf="$EDITOR ~/Library/Application\ Support/lazygit/config.yml"

alias update-snapshots="gh workflow run pull-request-update-snapshots.yml --ref"

# myip
myip=$(ipconfig getifaddr en0)

# Digital DealerCenter
# Office BC
export BCO_IP=10.2.0.153
export BCO_ST=4WSMH53
alias HBCO="HOST=$BCO_IP"

# Home BC
export BCH_IP=192.168.2.111
export BCH_ST=CG7L9R2
alias HBCH="HOST=$BCH_IP"

export BAT_THEME="Nord"

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

# begin the empty window at the bottom
# tput cup "$LINES"

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
