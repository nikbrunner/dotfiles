# Is this not default?
export XDG_CONFIG_HOME="$HOME/.config"

# HomeBrew
brew_path="/opt/homebrew/bin"
brew_opt_path="/opt/homebrew/opt"
export PATH=${brew_path}:${PATH}
export PATH=${brew_opt_path}/python@3.10/bin/python3:$PATH

# Path Exports ===========================================================
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.scripts:$PATH
export PATH=$HOME/Applications:$PATH
export PATH=/usr/bin/python:$PATH
export PATH=/usr/bin/python3:$PATH 
export PATH=$HOME/.deno/bin:$PATH

# NVM ====================================================================
export NVM_DIR=$HOME/.nvm
[ -s "${brew_opt_path}/nvm/nvm.sh" ] && . "${brew_opt_path}/nvm/nvm.sh"

# Oh My ZSH ==============================================================
export ZSH="$HOME/.oh-my-zsh"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
ZSH_THEME=robbyrussell
source $ZSH/oh-my-zsh.sh

# Globals ================================================================
export EDITOR="nvim"

export BC_OFFICE_IP=10.2.0.154
export BC_OFFICE_ST=4WSMH53
export BC_DANIEL_IP=10.2.0.128
export BC_BEN_IP=10.2.0.94
export BC_HOME_IP=192.168.2.107
export BC_HOME_ST=CG7L9R2
export BC_JULIA_IP=10.2.0.195
export BC_JULIA_ST=CNRFGQ2

export BAT_THEME="base16"

# Aliases ================================================================
# Dotfiles 
alias df='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dfu='df add -u && df commit -m "Update dotfiles" && df push'
alias dfs='df status'
alias dflg='lazygit --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'


alias ls="exa --all --oneline --long --icons --sort=type"
alias lt="exa --all --tree --icons --sort=type --level=1 --ignore-glob=\"node_modules|.git\""
alias lg="lazygit"
alias tn="tmux new"
alias ta="tmux attach"
alias tk="tmux kill-server"
alias zj="zellij"
alias lazyvim="NVIM_APPNAME=lazyvim nvim"

alias start="tmux new -s dots -c ~/.config/nvim && rr"
alias scratch="$EDITOR $HOME/scratchpad.md"

# Yazi ==================================================================
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# fzf ====================================================================
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --no-ignore-vcs'
export FZF_DEFAULT_OPTS=" --bind 'ctrl-e:execute(echo {+} | xargs -o nvim)' "
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --highlight-line \
  --info=inline-right \
  --prompt='  ' \
  --ansi \
  --border \
  --layout=reverse \
  --no-scrollbar \
  --color=16 \
  --color=gutter:-1 \
"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(fzf --zsh)"

# Git Branch Switcher ====================================================
git_branch_switch() {
    local branches
    local target

    if [[ "$1" == "-a" || "$1" == "--all" ]]; then
        # Show all branches (local and remote)
        branches=$(git branch -a | grep -v HEAD | sed "s/.* //")
    else
        # Show only local branches
        branches=$(git branch | sed "s/.* //")
    fi

    target=$(echo "$branches" | fzf --ansi --preview-window=top:70% \
        --preview="git -c color.ui=always log -n 50 --graph --color=always \
        --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' {}")

    if [[ -n "$target" ]]; then
        if [[ "$target" == remotes/* ]]; then
            git checkout --track "${target#remotes/}"
        else
            git checkout "$target"
        fi
    fi
}

# Alias for switching local Git branches using fzf
alias gbr='git_branch_switch'

# Alias for switching all (including remote) Git branches using fzf
alias gbra='git_branch_switch -a'

# Misc ==================================================================
myip=$(ipconfig getifaddr en0)

# Git completion =========================================================
zstyle ':completion:*:*:git:*' script ~/.config/.zsh/git-completion.bash
fpath=(~/.config/.zsh $fpath)
autoload -Uz compinit && compinit

# Zoxide =================================================================
eval "$(zoxide init --cmd cd zsh)"

# Starship ===============================================================
eval "$(starship init zsh)"

