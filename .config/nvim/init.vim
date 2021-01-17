" TODO Auto source this with an Auto cmd

source $HOME/.config/nvim/plug-config/fzf.vim

syntax on
set noerrorbells
set tabstop=4 
set softtabstop=4
set shiftwidth=4
set termguicolors
set copyindent
set smarttab
set cindent
set expandtab
set rnu nu
set nowrap
set hidden
set noswapfile
set nobackup
" set cursorline
set undofile
set undodir=~/.vim/undodir
set incsearch
set encoding=UTF-8
set nohlsearch
set foldmethod=indent
set scrolloff=16
set nocompatible
set mouse=a
set foldlevel=1
set cmdheight=2

filetype plugin on

set colorcolumn=45,75,120
" set signcolumn=yes
highlight ColorColumn ctermbg=0 guibg=lightgrey

" plugin-manager
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  AUTOcmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugins
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
call plug#end()

" theme ==================================================================
" Initial theming
let g:gruvbox_contrast_dark="hard"
let g:airline_theme='nord'
colorscheme nord
" highlight Normal guibg=none
hi Normal guibg=NONE ctermbg=NONE


" What is this?
" if exists('+termguicolors')
"   let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"   let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"   set termguicolors
" endif

" Switching themes
map <F6>                                     :colorscheme nord <bar> let g:airline_theme='bubblegum' <bar> set background=dark<CR>
map <F7>                                     :colorscheme gruvbox <bar> let g:airline_theme='gruvbox' <bar> set background=dark<CR>
map <F8>                                     :colorscheme github <bar> let g:airline_theme ='github' <bar> set background=dark<CR>

" Remaps
" General ================================================================
let mapleader = "\<Space>"

" Unmaps
nnoremap Q <nop>

" source, save, quit
nnoremap <leader><C-r>                       :source ~/.config/nvim/init.vim<CR>
nnoremap <silent><leader>s                   :wa<CR>
nnoremap <silent><leader>w                   :wq<CR>
nnoremap <silent><leader>qq                  :q<CR>
nnoremap <silent><leader>qa                  :qa<CR>
nnoremap <silent><leader>qp                  :tabdo NERDTreeClose<CR>:mksession! workspace.vim<CR>:wa<CR>:qa<CR>

" Navigation
" New splits
nnoremap <silent><leader>l                   :vsp<CR><C-W><C-l>
nnoremap <silent><leader>j                   :sp<CR><C-W><C-j>

" Resize panes
nnoremap <silent><M-k>                       :resize +5<CR>
nnoremap <silent><M-j>                       :resize -5<CR>
nnoremap <silent><M-l>                       :vertical:resize -5<CR>
nnoremap <silent><M-h>                       :vertical:resize +5<CR>

" Nav Tab
nnoremap <silent><S-Tab>                             :tabprevious<CR>
nnoremap <silent><Tab>                               :tabnext<CR>

" Go to tab by number
nnoremap <leader>1                           1gt
nnoremap <leader>2                           2gt
nnoremap <leader>3                           3gt
nnoremap <leader>4                           4gt
nnoremap <leader>5                           5gt
nnoremap <leader>6                           6gt
nnoremap <leader>7                           7gt
nnoremap <leader>8                           8gt
nnoremap <leader>9                           9gt
nnoremap <leader>0                           :tablast<CR>

" terminal
nnoremap `                                   :terminal<CR>jjA

" nerdtree ===============================================================
let g:NERDTreeIgnore=                        ['^node_modules$']
let g:NERDTreeGitStatusWithFlags=            1
let g:NERDTreeGitStatusNodeColorization=     1
let NERDTreeShowHidden=                      1

nnoremap <silent><expr><C-\>                 g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"

" git & vcs ==============================================================
nnoremap <leader>gs                          :G<CR>
nnoremap <leader>gc                          :Gcommit<CR>
nnoremap <leader>gpu                         :Gpush<CR>
nnoremap <leader>gpl                         :Gpull<CR>
nnoremap <leader>gl                          :GV<CR>
nnoremap <leader>gb                          :GV!<CR>
nnoremap <leader>g<C-b>                      :MerginalToggle<CR>
nnoremap <leader>u                           :UndotreeShow<CR>

" highlight yanking
if !exists('##TextYankPost')
  map y <Plug>(highlightedyank)
endif

" spell checking =========================================================
set spelllang=en_us,de_de
nmap <silent><F5>                            :set spell!<cr>

" emmet ==================================================================
let g:user_emmet_leader_key=                 '<C-e>'

" coc ====================================================================
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-css',
  \ ]

nmap <silent> gd                             <Plug>(coc-definition)
nmap <silent> gy                             <Plug>(coc-type-definition)
nmap <silent> gi                             <Plug>(coc-implementation)
nmap <silent> gr                             <Plug>(coc-references)
nmap <silent><leader>rn                      <Plug>(coc-rename)
nmap <silent> gh                             :call <SID>show_documentation()<CR>
inoremap <silent><expr><c-space>             coc#refresh()
inoremap <silent><expr><C-j>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><C-k>                             pumvisible() ? "\<C-p>" : "\<C-h>"


" SCSS files
autocmd FileType scss setl iskeyword+=@-@

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" goyo ====================================================================
nmap <silent><leader>z                       :Goyo<CR>

function! s:goyo_enter()
  set scrolloff=999
endfunction

function! s:goyo_leave()
  set scrolloff=5
  hi Normal guibg=NONE ctermbg=NONE
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
