" TODO Go deeper with vim-fugitive
syntax on

set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
" set smartindent
set copyindent
set smarttab
set cindent
set expandtab
set rnu nu
set nowrap
set smartcase
set noswapfile
set nobackup
set cursorline
set undofile
set incsearch
set encoding=UTF-8
" set scrolloff=999

set nocompatible
filetype plugin on

"set colorcolumn=75
"highlight ColorColumn ctermbg=0 guibg=lightgrey

" Plugin-Manager
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin()
" Themes
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'
Plug 'cormacrelf/vim-colors-github'
" General Workflow Enhancements
Plug 'tpope/vim-commentary'
Plug 'junegunn/goyo.vim'
Plug 'mattn/emmet-vim'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'chaoren/vim-wordmotion'
" Appearence
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" File management
Plug '~/.fzf'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'git@github.com:mbbill/undotree.git'
" Completeness
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
" Markdown
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install'  }
" Formater
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
" Misc
Plug 'godlygeek/tabular'
call plug#end()



" Remaps
" general ================================================================
let mapleader = " "
nmap <C-r>      :source ~/.config/nvim/init.vim<CR>
map <silent><C-s>      :w<CR>
map <silent><C-w>      :wq<CR>
map <silent><C-q>      :q<CR>
"inoremap jk   <ESC> 
nmap Q         <nop>
xmap K         :move '<-2<CR>gv-gv
xmap J         :move '>+1<CR>gv-gv
nmap <leader>l :vsp<CR>
nmap <leader>j :sp<CR>

" Undootree ==============================================================
nnoremap <leader>u :UndotreeShow<CR>

" Theme ==================================================================
" Init Theming
colorscheme nord
let g:airline_theme='bubblegum'

" Switching themes
map <F6> :colorscheme nord <bar> let g:airline_theme='bubblegum' <bar> set background=dark<CR>
map <F7> :colorscheme gruvbox <bar> let g:airline_theme='gruvbox' <bar> set background=dark<CR>
map <F8> :colorscheme github <bar> let g:airline_theme ='github' <bar> set background=dark<CR>

" spell checking =========================================================
set spelllang=en_us,de_de
nmap <silent> <F5> :set spell!<cr>

" git-fugitive
" CheatSheet https://gist.github.com/mikaelz/38600d22b716b39b031165cd6d201a67
nmap <leader>gs  :G<CR>
nmap <leader>gc  :Gcommit<CR>
nmap <leader>gpu :Gpush<CR>
nmap <leader>gpl :Gpull<CR>
nmap <leader>gl  :BCommits!<CR>

" merginal ==============================================================
nmap <C+9> :MerginalToggle<CR>

" emmet ==================================================================
let g:user_emmet_leader_key='<C-e>'

" RipGrep ================================================================
nmap <leader>ps :Rg<space>
if executable('rg')
    let g:rg_derive_root='true'
endif

" fzf ====================================================================
" map <C-f> <Esc><Esc>:Files!<CR>
" inoremap <C-f> <Esc><Esc>:BLines!<CR>
command! -bang -nargs=*  All
  \ call fzf#run(fzf#wrap({'source': 'rg --files --hidden --no-ignore-vcs --glob "!{node_modules/*,.git/*}"', 'down': '40%', 'options': '--expect=ctrl-t,ctrl-x,ctrl-v --multi --reverse' }))
nmap <silent> <C-p> :All<cr>

" vifm ===================================================================
" nmap <leader>n               :EditVifm .<CR>

" nerdtree ===============================================================
" map <leader>t                :NERDTreeToggle<CR>
map <C-b>                :NERDTreeToggle<CR>

"map <leader>n :NERDTreeFind<CR> 
let g:NERDTreeIgnore = ['^node_modules$']

" nerdtree git============================================================
let g:NERDTreeGitStatusWithFlags = 1
"let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeGitStatusNodeColorization = 1
"let g:NERDTreeColorMapCustom = {
    "\ "Staged"    : "#0ee375",  
    "\ "Modified"  : "#d9bf91",  
    "\ "Renamed"   : "#51C9FC",  
    "\ "Untracked" : "#FCE77C",  
    "\ "Unmerged"  : "#FC51E6",  
    "\ "Dirty"     : "#FFBD61",  
    "\ "Clean"     : "#87939A",   
    "\ "Ignored"   : "#808080"   
    "\ }

" vim-markdown ===========================================================
" https://github.com/plasticboy/vim-markdown/
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_folding_disabled = 1
" nnoremap <silent> <C-t> :Toc<CR>

" markdown-preview =======================================================
" https://github.com/iamcco/markdown-preview.nvim
"nmap <C-p> <Plug>MarkdownPreviewToggle
nmap <leader>p <Plug>MarkdownPreviewToggle<CR>

" prettier
" command! -nargs=0 Prettier :CocCommand prettier.formatFile
"let g:prettier#autoformat = 0
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" coc ====================================================================
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]

imap <C-l> <Plug>(coc-snippets-expand)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
"
" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" goyo ====================================================================
nmap <silent><leader>z :Goyo<CR>
function! s:goyo_enter()
  set scrolloff=999
endfunction

function! s:goyo_leave()
  set scrolloff=5
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
