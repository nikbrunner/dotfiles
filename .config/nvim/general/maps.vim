" general remaps
let mapleader = "\<Space>"

" Unmaps
nnoremap Q <nop>

" source, save, quit
nnoremap <leader><C-r>                       :source ~/.config/nvim/init.vim<CR>
nnoremap <silent><leader>s                   :wa<CR>
nnoremap <silent><leader>w                   :wq<CR>
nnoremap <silent><leader>q                   :q!<CR>
nnoremap <silent><leader>ps                  :Obsess<CR>

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
nnoremap <silent><expr>¡                     g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"

" fzf
nnoremap <silent><C-p>                       <Esc><Esc>:Files<CR>
nnoremap <silent><C-f>                       <Esc><Esc>:BLines!<CR>
nnoremap <silent><C-e>                       <Esc><Esc>:Buffers<CR>
nnoremap <silent><F12>                       <Esc><Esc>:Rg<space><CR>

" emmet
let g:user_emmet_leader_key=                 '<C-.>'

" git-fugitive
nnoremap <leader>gs                          :G<CR>
nnoremap <leader>gc                          :Gcommit<CR>
nnoremap <leader>gpu                         :Gpush<CR>
nnoremap <leader>gpl                         :Gpull<CR>
nnoremap <leader>gl                          :GV<CR>
nnoremap <leader>gb                          :GV!<CR>
nnoremap <leader>g<C-b>                      :MerginalToggle<CR>
nnoremap <leader>u                           :UndotreeShow<CR>
