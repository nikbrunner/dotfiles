if has ('autocmd') " Remain compatible with earlier versions
 " augroup vimrc     " Source vim configuration upon save
 "    autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
 "    autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
 "  augroup END
endif " has autocmd

" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
autocmd BufRead,BufNewFile *.ts        set filetype=typescript

autocmd InsertEnter * set nocul
autocmd InsertLeave * set cul 
