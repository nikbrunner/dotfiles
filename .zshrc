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
export PATH=$HOME/.scripts/bin:$PATH
export PATH=$HOME/Applications:$PATH
export PATH=/usr/bin/python:$PATH
export PATH=/usr/bin/python3:$PATH export PATH=$HOME/.deno/bin:$PATH

export NVM_DIR=$HOME/.nvm
export PATH=${brew_path}:${PATH}
export PATH=${brew_opt_path}/python@3.10/bin/python3:$PATH

# NVM
[ -s "${brew_opt_path}/nvm/nvm.sh" ] && . "${brew_opt_path}/nvm/nvm.sh"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME="bira"
# ZSH_THEME="nicoulaj"
# ZSH_THEME="amuse"
plugins=(git zsh-vi-mode zsh-z zsh-autosuggestions zsh-syntax-highlighting)

# Edit Config Files ======================================================
export EDITOR="nvim"
alias clear_nvim_cache="rm -rf ~/.cache/nvim"
alias clear_nvim_data="rm -rf ~/.local/share/nvim"
alias clear_nvim_state="rm -rf ~/.local/state/nvim"
alias clear_nvim_all="clear_nvim_cache; clear_nvim_data; clear_nvim_state"

# Dotfiles =================================================================
alias df='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dfu='df add -u && df commit -m "Update dotfiles" && df push'
alias dfs='df status -s'

# Basics =================================================================
# This is necessary because it sets an alias for ls, which I want to build myself
DISABLE_LS_COLORS="true"

# alias ls="ls -a"
alias ls="exa --all --oneline --long --icons --sort=type"
alias lt="exa --all --tree --icons --sort=type --level=1 --ignore-glob=\"node_modules|.git\""

alias lg="lazygit"
alias nu="npm-upgrade"
alias tn="tmux new"
alias ta="tmux attach"
alias zj="zellij"

# Vim
alias vin='NVIM_APPNAME="vin" nvim'
alias lv='NVIM_APPNAME="nvim" nvim'
alias neovide="open -a Neovide"

alias python="python3"
alias pip="pip3"

alias tldrf='tldr --list | fzf --preview "tldr {1} --color=always" --preview-window=right,70% | xargs tldr'
alias checkout="gh pr list -s open | fzf --preview 'gh pr view {1}' | awk '{print $1}' | xargs gh pr checkout"
alias ts="smug list | fzf | xargs smug start"

# Kitty
alias theme="kitty +kitten themes --reload-in=all "
alias themes="kitty +kitten themes"
# alias ssh='env TERM=xterm-256color ssh' # allows kitty to work with ssh

alias scratch="code $HOME/scratchpad.md"

# myip
myip=$(ipconfig getifaddr en0)

# BikeCenter
export BC_OFFICE_IP=10.2.0.154
export BC_OFFICE_ST=4WSMH53

export BC_HOME_IP=192.168.2.107
export BC_HOME_ST=CG7L9R2

export BC_JULIA_IP=10.2.0.71
export BC_JULIA_ST=8RBL9R2

export BC_CONSTANTIN_IP=10.2.0.187
export BC_CONSTANTIN_ST=CNRFGQ2

# Bat

export BAT_THEME="Nord"

# fzf ====================================================================
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --no-ignore-vcs'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

alias fzfi='rg --files --hidden --follow --no-ignore-vcs -g "!{node_modules,.git}" | fzf`'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# neovim-remotee==========================================================
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

# Remove if solved: https://github.com/romkatv/powerlevel10k/issues/1554#issuecomment-1701598955
unset ZSH_AUTOSUGGEST_USE_ASYNC

# begin the empty window at the bottom
# tput cup "$LINES"

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
