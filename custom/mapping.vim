noremap ; :

" use jk to quickly escape to normal mode while typing
inoremap jk <ESC>

" Don't use arrow keys
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

" Automatically add closing ( { [ ' " `
inoremap {<cr> {<cr>}<ESC>kA<CR>
inoremap { {}<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i

" insert newline without entering insert mode
noremap <CR> o<Esc>k

" reloads .vimrc -- making all changes active
noremap <silent> <leader>v :source ~/.config/nvim/init.vim<CR>:PlugInstall<CR>:bdelete<CR>:exe ":echo 'vimrc reloaded'"<CR>


" QUIT
nnoremap <leader>wq :wq<CR>
nnoremap <leader>w :w<CR>

" tab navigation mappings
nnoremap tt :tabnew
nnoremap tq :tabclose<CR>
nnoremap tn :tabnext<CR>

noremap <M-Right> :tabn<CR>
inoremap <M-Right> <ESC>:tabn<CR>
noremap <M-Left> :tabp<CR>
inoremap <M-Left> <ESC>:tabp<CR>

" Easy window navigation (split)
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l