
filetype plugin on

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  AUTOcmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
    " themes
    Plug 'arcticicestudio/nord-vim'
    Plug 'morhetz/gruvbox'
    Plug 'cormacrelf/vim-colors-github'
    Plug 'gilgigilgil/anderson.vim'

    " appearence
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " general workflow 
    Plug 'tpope/vim-commentary'
    Plug 'junegunn/goyo.vim'
    Plug 'mattn/emmet-vim'
    Plug 'chaoren/vim-wordmotion'
    Plug 'djoshea/vim-autoread'
    Plug 'machakann/vim-highlightedyank'
    Plug 'godlygeek/tabular'
 
    " file management
    Plug '~/.fzf'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter'
    Plug 'preservim/nerdtree'
    Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}
    Plug 'git@github.com:mbbill/undotree.git'
    Plug 'francoiscabrol/ranger.vim'
    Plug 'rbgrouleff/bclose.vim'

    " Code completion
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " git
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'idanarye/vim-merginal'
    Plug 'junegunn/gv.vim'

    " window managment
    Plug 'christoomey/vim-tmux-navigator'

    " language
    Plug 'leafgarland/typescript-vim'
    Plug 'yuezk/vim-js'
    Plug 'maxmellon/vim-jsx-pretty'
    Plug 'HerringtonDarkholme/yats.vim'

    " formater
    Plug 'prettier/vim-prettier', { 'do': 'npm install' }

    " icons
    Plug 'ryanoasis/vim-devicons'
call plug#end()

