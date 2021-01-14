" TODO Go deeper with vim-fugitive
" TODO Todo aggregator
" TODO Save iTerm config
" TODO tig/gv.vim
" TODO Fix "no eslint file" found warning
" TODO Auto reveal active file
" TODO Set shortcuts for editor-tabs
"
" RESEARCH Terminal in VIM
" RESEARCH TMUX

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
" set scrolloff=999
" set smartindent

set nocompatible
filetype plugin on

set colorcolumn=45
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

" Unmaps
nmap Q         <nop>
nmap H         <nop>
nmap L         <nop>

" Remaps
" general ================================================================
let mapleader = " "
nmap <C-r><C-r>                              :source ~/.config/nvim/init.vim<CR>
map <silent><C-s>                            :wa<CR>
map <silent><C-w>                            :wq<CR>
map <silent><C-q>                            :q<CR>

" Navigation
" nnoremap <C-,>                           :30winc ><CR>
" nnoremap <C-.>                           :30winc <<CR>

" New splits
nnoremap <silent><leader>l                   :vsp<CR>
nnoremap <silent><leader>j                   :sp<CR>

" Nav Tab
nnoremap H                                   :tabprevious<CR>
nnoremap L                                   :tabnext<CR>

" Go to tab by number
noremap <leader>1                            1gt
noremap <leader>2                            2gt
noremap <leader>3                            3gt
noremap <leader>4                            4gt
noremap <leader>5                            5gt
noremap <leader>6                            6gt
noremap <leader>7                            7gt
noremap <leader>8                            8gt
noremap <leader>9                            9gt
noremap <leader>0                            :tablast<cr>

" Undootree ==============================================================
nnoremap <leader>u                           :UndotreeShow<CR>

" Theme ==================================================================
" Init Theming
colorscheme gruvbox
let g:airline_theme='gruvbox'

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Highlight Yanking
if !exists('##TextYankPost')
  map y <Plug>(highlightedyank)
endif

" Switching themes
map <F6>                                     :colorscheme nord <bar> let g:airline_theme='bubblegum' <bar> set background=dark<CR>
map <F7>                                     :colorscheme gruvbox <bar> let g:airline_theme='gruvbox' <bar> set background=dark<CR>
map <F8>                                     :colorscheme github <bar> let g:airline_theme ='github' <bar> set background=dark<CR>

" spell checking =========================================================
set spelllang=en_us,de_de
nmap <silent><F5>                            :set spell!<cr>

" git-fugitive
" CheatSheet https://gist.github.com/mikaelz/38600d22b716b39b031165cd6d201a67
nmap <leader>gs                              :G<CR>
nmap <leader>gc                              :Gcommit<CR>
nmap <leader>gpu                             :Gpush<CR>
nmap <leader>gpl                             :Gpull<CR>
nmap <leader>gl                              :BCommits!<CR>

" merginal ==============================================================
nmap <C-g>                                   :MerginalToggle<CR>

" emmet ==================================================================
let g:user_emmet_leader_key=                 '<C-e>'

" RipGrep ================================================================
" QuerySearch
nmap <silent><leader>q                       :Rg<space>

if executable('rg')
    let g:rg_derive_root='true'
endif

" fzf ====================================================================
command! -bang -nargs=*  All
  \ call fzf#run(fzf#wrap({'source': 'rg --files --hidden --no-ignore-vcs --glob "!{node_modules/*,.git/*}"', 'down': '40%', 'options': '--expect=ctrl-t,ctrl-x,ctrl-v --multi --reverse' }))
map <silent><C-p>                            :All<cr>
map <silent><leader>p                        <Esc><Esc>:Files!<CR>
imap <silent><C-f>                           <Esc><Esc>:BLines!<CR>

" nerdtree ===============================================================
let g:NERDTreeIgnore =                       ['^node_modules$']
map <C-b>                                    :NERDTreeToggle<CR>

" TODO This made Problems. (Opened sometimes two trees, and there was a delay
" when navigating from the tree with C-l )
"
" Check if NERDTree is open or active
" function! IsNERDTreeOpen()        
"   return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
" endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
" function! SyncTree()
"   if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
"     NERDTreeFind
"     wincmd p
"   endif
" endfunction

" Highlight currently open buffer in NERDTree
" autocmd BufEnter * call SyncTree()

" nerdtree git============================================================
let g:NERDTreeGitStatusWithFlags = 1
"let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeGitStatusNodeColorization = 1


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

" SCSS files
autocmd FileType scss setl iskeyword+=@-@

nmap <silent><leader> oi                     :CocCommand tsserver.organizeImports<CR>
nmap <silent> gd                             <Plug>(coc-definition)
nmap <silent> gy                             <Plug>(coc-type-definition)
nmap <silent> gi                             <Plug>(coc-implementation)
nmap <silent> gr                             <Plug>(coc-references)

" Quick documentation
nmap <silent> gh                             :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB>                       pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr><c-space>             coc#refresh()
"
" Remap for rename current word
nmap <silent><leader>rn                      <Plug>(coc-rename)

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
