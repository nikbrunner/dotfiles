" General Vim settings
syntax on                                                  " Turn on syntax highlighting

set nocompatible                                           " Don't try to be vi compatible
set encoding=utf-8                                         " Set default encoding to UTF-8
set clipboard=unnamedplus                                  " Use the system clipboard
set hidden                                                 " Allow hidden buffers
set ttyfast                                                " Faster rendering
set path+=**
set wildmenu
set ru rnu                                                 " Show relative and absolute line numbers
set splitright                                             " Split windows to the right
set ruler                                                  " Show file stats
set belloff=all                                            " Deactivate bell for all events
set nowrap                                                 " Enable line wrap
set tabstop=4                                              " Number of spaces tabs count for
set shiftwidth=4                                           " Size of an indent
set softtabstop=4                                          " Number of spaces in tab while editing
set expandtab                                              " Use spaces instead of tabs
set noshiftround                                           " Don't round indent to multiple of 'shiftwidth'
set noswapfile                                             " Don't use swapfile
set scrolloff=12                                           " Keep 3 lines when scrolling
set showmode                                               " Show current mode
set showcmd                                                " Show command in bottom bar
set hlsearch                                               " Highlight search results
set incsearch                                              " Show search matches as you type
set ignorecase                                             " Ignore case when searching
set smartcase                                              " Override ignorecase if search contains uppercase
set showmatch                                              " Highlight matching brackets
set redrawtime=10000                                       " Increase redrawtime to 10000 milliseconds (10 seconds)

" Key Mappings
let mapleader = " "                                        " Set leader key to space

nnoremap <C-h> <C-w>h                                      " Navigate windows to the left
nnoremap <C-j> <C-w>j                                      " Navigate windows down
nnoremap <C-k> <C-w>k                                      " Navigate windows up
nnoremap <C-l> <C-w>l                                      " Navigate windows to the right

nnoremap ]q :cnext<CR>                                     " Go to the next item in quickfix list
nnoremap [q :cprev<CR>                                     " Go to the previous item in quickfix list

nnoremap <leader>s :setlocal spell!<CR>                    " Toggle spell check
nnoremap <leader>e :Lex<CR>                                " Open Netrw file explorer
nnoremap <Esc> :noh<CR>                                    " Clear search highlights

nnoremap Y y$                                              " Make Y behave like other capital letters

" Netrw Settings
let g:netrw_keepdir = 0                                    " Keep the current directory and the browsing directory synced
let g:netrw_banner = 0                                     " Hide the banner
let g:netrw_liststyle = 3                                  " Change list style to tree
let g:netrw_browse_split = 0                               " Open files in the same window
let g:netrw_altv = 1                                       " Open splits to the right
let g:netrw_winsize = 20                                   " Narrow the file browser split

" Auto Commands
" If a new file is opened, equalize the splits except the file explorer
autocmd BufRead * nested :silent! wincmd =
autocmd FileType netrw setlocal bufhidden=delete

" Colors and Fonts
set background=dark                                        " Prefer dark background
colorscheme habamax                                        " Set colorscheme
