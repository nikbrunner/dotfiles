" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" Pick a leader key
let mapleader = " "

" Clipboard
set clipboard=unnamed

" Security
set modelines=0

" Show line numbers
set ru rnu
set splitright

" Show file stats
set ruler

" Deactivate bell
set belloff=all

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround
set noswapfile

set path+=**
set wildmenu
set wildignore+=comma,separated,list,of,file,patterns

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim


" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

" Color scheme (terminal)
set t_Co=256
set background=dark

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Move to beginning and end of line
nnoremap H ^
nnoremap L $

" Nav through splits
nnoremap <C-h> <C-w>h 
nnoremap <C-j> <C-w>j 
nnoremap <C-k> <C-w>k 
nnoremap <C-l> <C-w>l 

" Explorer
let g:NetrwIsOpen=0
" Keep the current directory and the browsing directory synced to avoid file move errors 
let g:netrw_keepdir = 0
" Hide the banner
let g:netrw_banner = 1
" Change list style to tree
let g:netrw_liststyle = 3
" Open files in another split
let g:netrw_browse_split = 0
let g:netrw_altv = 1
" narrow the file browser split
let g:netrw_winsize = 20 

