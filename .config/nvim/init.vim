" TODO Auto source this with an Auto cmd

source $HOME/.config/nvim/general/sets.vim
source $HOME/.config/nvim/general/theme.vim
source $HOME/.config/nvim/general/maps.vim
source $HOME/.config/nvim/general/autocmd.vim

" plugins
source $HOME/.config/nvim/plug-config/plugins.vim
source $HOME/.config/nvim/plug-config/vim-fzf.vim
source $HOME/.config/nvim/plug-config/vim-gitgutter.vim
source $HOME/.config/nvim/plug-config/vim-fugitive.vim
source $HOME/.config/nvim/plug-config/vim-coc.vim
source $HOME/.config/nvim/plug-config/vim-coc.vim

" tree ===============================================================
let g:NERDTreeIgnore=                        ['^node_modules$']
let g:NERDTreeGitStatusWithFlags=            1
let g:NERDTreeGitStatusNodeColorization=     1
let NERDTreeShowHidden=                      1
nnoremap <silent><leader>qp                  :tabdo NERDTreeClose<CR>:mksession! workspace.vim<CR>:wa<CR>:qa<CR>

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
let g:user_emmet_leader_key=                 '<C-,>'
