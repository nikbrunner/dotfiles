" general remaps
let mapleader = "\<Space>"

" Unmaps
nnoremap Q <nop>

" source, save, quit
nnoremap <leader><C-r>                       :source ~/.config/nvim/init.vim<CR>
nnoremap <silent><leader>s                   :wa<CR>
nnoremap <silent><leader>w                   :wq<CR>
nnoremap <silent><leader>q                   :q!<CR>

" New splits
nnoremap <silent><leader>l                   :vsp<CR><C-W><C-l>
nnoremap <silent><leader>j                   :sp<CR><C-W><C-j>

" Resize panes
nnoremap <silent>˚                           :resize +5<CR>
nnoremap <silent>∆                           :resize -5<CR>
nnoremap <silent>¬                           :vertical:resize -5<CR>
nnoremap <silent>˙                           :vertical:resize +5<CR>

" Nav Tab
nnoremap <silent><S-Tab>                     :tabprevious<CR>
nnoremap <silent><Tab>                       :tabnext<CR>

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

" Switching themes
map <F6>                                     :colorscheme nord <bar> let g:airline_theme='bubblegum' <bar> set background=dark<CR>
map <F7>                                     :colorscheme gruvbox <bar> let g:airline_theme='gruvbox' <bar> set background=dark<CR>
map <F8>                                     :colorscheme github <bar> let g:airline_theme ='github' <bar> set background=dark<CR>

" nerdtree
" nnoremap <silent><leader>pq                  :tabdo NERDTreeClose<CR>:mksession! workspace.vim<CR>:wa<CR>:qa<CR>
nnoremap <silent><expr>¡                     g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"
