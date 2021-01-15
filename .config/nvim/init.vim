" TODO Go deeper with vim-fugitive
" TODO TODO aggregator plugin
" TODO Save iTerm config
" TODO tig/gv.vim
" TODO Auto reveal active file
" TODO Ale
" TODO TMUX / Navigator

syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set copyindent
set smarttab
set cindent
set expandtab
set rnu nu
set nowrap
set noswapfile
set nobackup
set cursorline
set undofile
set incsearch
set encoding=UTF-8
set nohlsearch
set foldmethod=indent
set scrolloff=16
set nocompatible
" set notimeout
" set smartindent

filetype plugin on

set colorcolumn=45,75,120
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Plugin-Manager
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  AUTOcmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin()
    " Themes
    Plug 'arcticicestudio/nord-vim'
    Plug 'morhetz/gruvbox'
    Plug 'cormacrelf/vim-colors-github'
    Plug 'gilgigilgil/anderson.vim'

    " Appearence
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " General Workflow Enhancements
    Plug 'tpope/vim-commentary'
    Plug 'junegunn/goyo.vim'
    Plug 'mattn/emmet-vim'
    Plug 'chaoren/vim-wordmotion'
    Plug 'djoshea/vim-autoread'
    Plug 'machakann/vim-highlightedyank'

    " File management
    Plug '~/.fzf'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'preservim/nerdtree'
    Plug 'git@github.com:mbbill/undotree.git'

    " Code completion 
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Git
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'idanarye/vim-merginal'

    " Window managment
    Plug 'christoomey/vim-tmux-navigator'

    " Language specifics
    Plug 'leafgarland/typescript-vim' 
    Plug 'yuezk/vim-js'
    Plug 'maxmellon/vim-jsx-pretty'
    Plug 'HerringtonDarkholme/yats.vim'

    " Formater
    Plug 'prettier/vim-prettier', { 'do': 'npm install' }

    " Misc
    Plug 'godlygeek/tabular'
call plug#end()

" theme ==================================================================
" Initial theming
colorscheme gruvbox
let g:airline_theme='gruvbox'

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Switching themes
map <F6>                                     :colorscheme nord <bar> let g:airline_theme='bubblegum' <bar> set background=dark<CR>
map <F7>                                     :colorscheme gruvbox <bar> let g:airline_theme='gruvbox' <bar> set background=dark<CR>
map <F8>                                     :colorscheme github <bar> let g:airline_theme ='github' <bar> set background=dark<CR>

" Remaps
" General ================================================================
let mapleader = "\<Space>"

" Unmaps
nnoremap Q <nop>
nnoremap H <nop>
nnoremap L <nop>

" source, save, quit
nnoremap <leader><C-r>                       :source ~/.config/nvim/init.vim<CR>
nnoremap <silent><leader>s                   :wa<CR>
nnoremap <silent><leader>w                   :wq<CR>
nnoremap <silent><leader>q                   :q<CR>

" Navigation
" New splits
nnoremap <silent><leader>l                   :vsp<CR>
nnoremap <silent><leader>j                   :sp<CR>

" Resize panes
nnoremap <silent>∆                           :resize +5<CR>
nnoremap <silent>˚                           :resize -5<CR>
nnoremap <silent>¬                           :vertical:resize -5<CR>
nnoremap <silent>˙                           :vertical:resize +5<CR>

" Nav Tab
nnoremap H                                   :tabprevious<CR>
nnoremap L                                   :tabnext<CR>

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

nnoremap <leader>tt :tab term<CR>
tnoremap <Esc> exit<CR><CR>

" nerdtree ===============================================================
let g:NERDTreeIgnore =                       ['^node_modules$']
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeGitStatusNodeColorization = 1

map ¡                                        :NERDTreeToggle<CR>

" TODO This made Problems. (Opened sometimes two trees, and there was a delay
" when navigating from the tree with C-l )
"
" Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

" git & vcs ==============================================================
" git-fugitive
nnoremap <leader>gs                          :G<CR>
nnoremap <leader>gc                          :Gcommit<CR>
nnoremap <leader>gpu                         :Gpush<CR>
nnoremap <leader>gpl                         :Gpull<CR>
nnoremap <leader>gl                          :BCommits!<CR>
nnoremap <leader>g<C-b>                      :MerginalToggle<CR>
nnoremap <leader>u                           :UndotreeShow<CR>

" fzf/rg - Search & Query ====================================================================
nnoremap <silent><C-p>                       <Esc><Esc>:ProjectFiles<CR>
nnoremap <silent><C-f>                       <Esc><Esc>:BLines!<CR>
nnoremap <silent><leader>p                   <Esc><Esc>:All<CR>
nnoremap <silent><leader>f                   <Esc><Esc>:Rg<space><CR>

command! -bang -nargs=*  All
  \ call fzf#run(fzf#wrap({'source': 'rg --files --hidden --no-ignore-vcs --glob "!{node_modules/*,.git/*}"', 'down': '40%', 'options': '--expect=ctrl-t,ctrl-x,ctrl-v --multi --reverse' }))

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()

if executable('rg')
    let g:rg_derive_root='true'
endif

" WhichKey ===============================================================
" nnoremap <silent><leader>                    :WhichKeyVisual '<Space>'<CR>
" nnoremap <silent><leader>                    :<c-u>WhichKeyVisual '<Space>'<CR>
" nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
" vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" highlight uanking
if !exists('##TextYankPost')
  map y <Plug>(highlightedyank)
endif

" spell checking =========================================================
set spelllang=en_us,de_de
nmap <silent><F5>                            :set spell!<cr>

" emmet ==================================================================
let g:user_emmet_leader_key=                 '<C-e>'

" coc ====================================================================
nnoremap <silent> gd                         <Plug>(coc-definition)
nnoremap <silent> gy                         <Plug>(coc-type-definition)
nnoremap <silent> gi                         <Plug>(coc-implementation)
nnoremap <silent> gr                         <Plug>(coc-references)
nnoremap <silent><leader>rn                  <Plug>(coc-rename)
nnoremap <silent> gh                         :call <SID>show_documentation()<CR>
inoremap <silent><expr><c-space>             coc#refresh()
inoremap <silent><expr>∆
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr>˚                             pumvisible() ? "\<C-p>" : "\<C-h>"

let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-css', 
  \ ]

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
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
