" TODO Auto source this with an Auto cmd

source $HOME/.config/nvim/general/sets.vim
source $HOME/.config/nvim/plug-config/vim-fzf.vim
source $HOME/.config/nvim/plug-config/vim-gitgutter.vim
source $HOME/.config/nvim/plug-config/vim-fugitive.vim
source $HOME/.config/nvim/plug-config/vim-coc.vim

filetype plugin on

" plugin-manager
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  AUTOcmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if has ('autocmd') " Remain compatible with earlier versions
 augroup vimrc     " Source vim configuration upon save
    autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
    autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
  augroup END
endif " has autocmd

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

" theme ==================================================================
" Initial theming
let g:gruvbox_contrast_dark="hard"
let g:airline_theme='gruvbox'
colorscheme gruvbox
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
nnoremap <silent><C-s>                       :wa<CR>
nnoremap <silent><C-w>                       :wq<CR>
nnoremap <silent><C-q>                       :q!<CR>
nnoremap <silent><leader>qp                  :tabdo NERDTreeClose<CR>:mksession! workspace.vim<CR>:wa<CR>:qa<CR>

" Navigation
" New splits
nnoremap <silent><leader>l                   :vsp<CR><C-W><C-l>
nnoremap <silent><leader>j                   :sp<CR><C-W><C-j>

" Resize panes
nnoremap <silent>˚                       :resize +5<CR>
nnoremap <silent>∆                       :resize -5<CR>
nnoremap <silent>¬                       :vertical:resize -5<CR>
nnoremap <silent>˙                       :vertical:resize +5<CR>

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

" tree ===============================================================
let g:NERDTreeIgnore=                        ['^node_modules$']
let g:NERDTreeGitStatusWithFlags=            1
let g:NERDTreeGitStatusNodeColorization=     1
let NERDTreeShowHidden=                      1

nnoremap <silent><expr>¡                     g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"
nnoremap <silent>™                           <cmd>CHADopen<cr>

" highlight yanking
if !exists('##TextYankPost')
  map y <Plug>(highlightedyank)
endif

" spell checking =========================================================
set spelllang=en_us,de_de
nmap <silent><F5>                            :set spell!<cr>

" emmet ==================================================================
let g:user_emmet_leader_key=                 '<C-e>'

" goyo ====================================================================
nmap <silent><leader>z                       :Goyo<CR>

function! s:goyo_enter()
  set scrolloff=999
endfunction

function! s:goyo_leave()
hi Normal guibg=NONE ctermbg=NONE
  set scrolloff=5
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
