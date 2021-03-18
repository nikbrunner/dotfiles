" general remaps
let mapleader = " "

" Unmaps
nnoremap Q <nop>

" source, save, quit
nnoremap <leader><C-r>                       :source ~/.config/nvim/init.vim<CR>
" Source Vim configuration file and install plugins
nnoremap <leader><C-r>r                      :source ~/.config/nvim/init.vim \| :PlugInstall<CR>

nnoremap <leader>w                           :wa<CR>
nnoremap <silent><CR>                        :wa<CR>
nnoremap <leader>wq                          :wq<CR>
nnoremap <leader>qo                          :wa<CR>:only<CR>
nnoremap <leader>q                           :q!<CR>
nnoremap <silent>Q                           :Bdelete menu<CR>

" Sessions
nnoremap <silent><leader>ps                  :Obsess<CR>

" New splits
nnoremap <silent><leader>l                   :vsp<CR><C-W><C-l>
nnoremap <silent><leader>j                   :sp<CR><C-W><C-j>

" Nav splits
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

nnoremap <silent><leader>=                   <C-w><C-=>

" Resize panes
nnoremap <silent>H                           :vertical:resize +5<CR>
nnoremap <silent>L                           :vertical:resize -5<CR>

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

" nerdtree
nnoremap <expr>¡                         g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"

" ranger
nnoremap <leader>f                           :EditVifm .<CR>

" tabs
nnoremap <leader>to                          :TabooOpen<Space>
nnoremap <leader>tn                          :TabooRename<Space>

" prettier
nnoremap <leader>p                           :PrettierAsync<CR>

" which-key
nnoremap <silent> <leader>                   :WhichKey '<Space>'<CR>

" fzf
" nnoremap <silent><C-p>                       <Esc><Esc>:Files<CR>
" nnoremap <silent><C-f>                       <Esc><Esc>:BLines!<CR>
" nnoremap <silent><C-b>                       <Esc><Esc>:Buffers<CR>
" nnoremap <silent><F12>                       <Esc><Esc>:Rg<space><CR>

" telescope
nnoremap <C-p>                               <cmd>Telescope find_files<cr>
nnoremap <F12>                               <cmd>Telescope live_grep<cr>
nnoremap <C-b>                               <cmd>Telescope buffers<cr>
nnoremap <leader>fh                          <cmd>Telescope help_tags<cr>

" emmet
let g:user_emmet_leader_key=                 '<C-y>'

" git-fugitive
nnoremap <leader>gs                          :G<CR> \| :resize 15<CR>
nnoremap <leader>gc                          :Gcommit<CR>
nnoremap <leader>gpu                         :Git push<CR>
nnoremap <leader>gpl                         :Git pull<CR>
nnoremap <leader>gl                          :GV<CR>
nnoremap <leader>gb                          :GV!<CR>
nnoremap <leader>g<C-b>                      :MerginalToggle<CR>
nnoremap <leader>u                           :UndotreeShow<CR>

" git-gutter
nmap ]h                                      <Plug>(GitGutterNextHunk) "same as default
nmap [h                                      <Plug>(GitGutterPrevHunk) "same as default
nmap ghs                                     <Plug>(GitGutterStageHunk)
nmap ghu                                     <Plug>(GitGutterUndoHunk)

" goyo
nmap <silent><leader>z                       :Goyo<CR>

" coc
nmap <silent> gd                             <Plug>(coc-definition)
nmap <silent> gy                             <Plug>(coc-type-definition)
nmap <silent> gi                             <Plug>(coc-implementation)
nmap <silent> gr                             <Plug>(coc-references)
nmap <silent> ca                             <Plug>(coc-codeaction)
nmap <silent> <M-.>                          <Plug>(coc-fix-current)
nmap <silent> <F2>                           <Plug>(coc-rename)
nmap <silent> gh                             :call <SID>show_documentation()<CR>
nmap <silent>!                               :CocCommand explorer<CR>
inoremap <silent><expr><c-space>             coc#refresh()
inoremap <silent><expr><C-j>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><C-k>                             pumvisible() ? "\<C-p>" : "\<C-h>"

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

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
