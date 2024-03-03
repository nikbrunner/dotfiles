# vim: ft=sh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# HomeBrew
brew_path="/opt/homebrew/bin"
brew_opt_path="/opt/homebrew/opt"

# Path Exports ===========================================================
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.scripts:$PATH
export PATH=$HOME/Applications:$PATH
export PATH=/usr/bin/python:$PATH
export PATH=/usr/bin/python3:$PATH 
export PATH=$HOME/.deno/bin:$PATH

export NVM_DIR=$HOME/.nvm
export PATH=${brew_path}:${PATH}
export PATH=${brew_opt_path}/python@3.10/bin/python3:$PATH

export XDG_CONFIG_HOME="$HOME/.config"

# NVM
[ -s "${brew_opt_path}/nvm/nvm.sh" ] && . "${brew_opt_path}/nvm/nvm.sh"

# ZSH
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-vi-mode zsh-autosuggestions zsh-syntax-highlighting)

# Dotfiles =================================================================
alias df='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dfu='df add -u && df commit -m "Update dotfiles" && df push'
alias dfs='df status -s'
alias dff="df ls-files | fzf --preview 'bat --style=numbers --color=always --line-range :500 {}' | xargs -I % nvim %"

# Basics =================================================================
# This is necessary because it sets an alias for ls, which I want to build myself
DISABLE_LS_COLORS="true"

# alias ls="ls -a"
alias ls="exa --all --oneline --long --icons --sort=type"
alias lt="exa --all --tree --icons --sort=type --level=1 --ignore-glob=\"node_modules|.git\""
alias lg="lazygit"
alias tn="tmux new"
alias ta="tmux attach"
alias tk="tmux kill-server"

# Vim
export EDITOR="nvim"

alias python="python3"
alias pip="pip3"

alias scratch="$EDITOR $HOME/scratchpad.md"

myip=$(ipconfig getifaddr en0)

export BC_OFFICE_IP=10.2.0.154
export BC_OFFICE_ST=4WSMH53
export BC_DANIEL_IP=10.2.0.128
export BC_BEN_IP=10.2.0.94
export BC_HOME_IP=192.168.2.107
export BC_HOME_ST=CG7L9R2
export BC_JULIA_IP=10.2.0.187
export BC_JULIA_ST=CNRFGQ2
export BAT_THEME="base16"

# fzf ====================================================================
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --no-ignore-vcs'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

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


source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(zoxide init --cmd cd zsh)"

# bun completions
  [ -s "/Users/nikolausbrunner/.bun/_bun" ] && source "/Users/nikolausbrunner/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit -m "wip: $(date)"'
