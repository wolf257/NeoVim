noremap ; :

" use jk to quickly escape to normal mode while typing
inoremap jk <ESC>

" Don't use arrow keys
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

" Automatically add closing ( { [ ' " `
inoremap { {}<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap " ""<ESC>i

" insert newline without entering insert mode
noremap <CR> o<Esc>k

" reloads .vimrc -- making all changes active
noremap <silent> <leader>v :source ~/.config/nvim/init.vim<CR>:PlugInstall<CR>:bdelete<CR>:exe ":echo 'vimrc reloaded'"<CR>


" QUIT
nnoremap <leader>wq :wq<CR>
nnoremap <leader>w :w<CR>

" SPLITTING
noremap ss :split<CR>
noremap sv :vsplit<CR>
noremap sq :q<CR>
"" navigation (split)
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l


" TABBING
nnoremap tt :tabnew<space>
nnoremap tq :tabclose<CR>
"" navigation (tab)
nnoremap th  :tabfirst<CR>
nnoremap tj :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>

" PLUGINS

" Files (similar to :FZF)
" nmap <leader>e :Files<CR>
nmap <leader>f :FZF<CR>
" open buffers
nmap <leader>b :Buffers<CR>
" commands finder mapping (all commands)
nmap <leader>c :Commands<CR>
" general code finder in current file mapping (find line. nice)
nmap <leader>l :BLines<CR>
" Lines in loaded buffers
nmap <leader>L :Lines<CR>
