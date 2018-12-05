"Au cas o`u l'on vt utiliser le fic de config vim 
"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath
"source ~/.vimrc

" ============================================================================
" Vim-plug initialization
" Avoid modify this section, unless you are very sure of what you are doing

let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.config/nvim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.config/nvim/autoload
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

" Obscure hacks done, you can now modify the rest of the .vimrc as you wish :)

" ============================================================================
" Active plugins
" You can disable or add new ones here:

" so vim-plug knows we are declaring the plugins we want to use
call plug#begin('~/.config/nvim/plugged')

" Better language packs
Plug 'sheerun/vim-polyglot'

" Automatically sort python imports
Plug 'fisadev/vim-isort'

" Automatically close parenthesis, etc
Plug 'Townk/vim-autoclose'

" Completion from other opened files
Plug 'Shougo/context_filetype.vim'

" Python autocompletion
Plug 'zchee/deoplete-jedi', { 'do': ':UpdateRemotePlugins' }

Plug 'tpope/vim-repeat'

" Just to add the python go-to-definition and similar features, 
" Plug 'davidhalter/jedi-vim'

Plug 'tomtom/tcomment_vim'

Plug 'tpope/vim-surround'

Plug 'sheerun/vim-polyglot'

Plug 'tpope/vim-vinegar'

Plug 'kien/ctrlp.vim'

" Snippets =======

Plug 'SirVer/ultisnips'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" LIGHTLINE =======
Plug 'itchyny/lightline.vim'

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'charvaluehex' ] ]
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B'
      \ },
      \ }

:set laststatus=2
set noshowmode

" NETRW =======
" Changing the directory view in netrw
let g:netrw_liststyle = 3

" No banner
let g:netrw_banner = 0

" How to Open new file
let g:netrw_browse_split = 3

" when browsing, <cr> will open the file by (0) re-using the same window
let g:netrw_browse_split = 3

" direction spliting
let g:netrw_altv = 1

" Win Size
let g:netrw_winsize = 25

"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END


" Tell vim-plug we finished declaring plugins, so it can load them
call plug#end()

" ============================================================================
" Install plugins the first time vim runs

if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif

""""""""""""""""""""""""""""""""""""""""""""""""
"                   SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""

"set nocompatible              " required
"filetype off                  " required

"GENERAL
"set cursorline  "highlight current line
set mouse=a "Activer la souris

"COLORS
syntax on "coloration syntaxique
set colorcolumn=120 "color the line if to long
set showmatch "highlight matching [{()}]
set showcmd "show command
" colorscheme solarized

if has("gui_vimr")
    colorscheme solarized8
endif

" remove ugly vertical lines on window division
set fillchars+=vert:\ 

"NUMBERING
"set number   "show line numbers
:set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

"SPACE AND TABS
"Conserve l'indentation courante sur les nouvelles lignes
set autoindent
"Conversion des tabulations en espaces
set expandtab
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4

filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu

" Remove whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Autosave when switching buffers
set autowrite

"SEARCH
set incsearch "search as characters are entered
set hlsearch "highlight matches
set ignorecase
nnoremap <leader><space> :nohlsearch<CR>

set lazyredraw          " redraw only when we need to.


""""""""""""""""""""""""""""""""""""""""""""""""
"                   MAPPING
""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = ','

" use jj to quickly escape to normal mode while typing
inoremap jj <ESC>

"" Don't use arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Automatically add closing ( { [ ' " `
inoremap {<cr> {<cr>}<ESC>kA<CR>
inoremap { {}<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i

" insert newline without entering insert mode
map <CR> o<Esc>k

" reloads .vimrc -- making all changes active
map <silent> <leader>v :source ~/.vimrc<CR>:PlugInstall<CR>:bdelete<CR>:exe ":echo 'vimrc reloaded'"<CR>

" Leader C prefix is for code related mappings (completion, tidy, documentation...)
" ,cc
noremap <silent> <leader>cc :TComment<CR>              "tcomment_vim

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" edit vimrc/zshrc and load vimrc bindings
" ,ev ,ez ,sv
nnoremap <leader>ev :vsp ~/.vimrc<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source ~/.vimrc<CR>

" ,wq ,w
nnoremap <leader>wq :wq<CR>
nnoremap <leader>w :w<CR>

map <C-n> :NERDTreeToggle<CR>

" tab navigation mappings
map tt :tabnew 
map <M-Right> :tabn<CR>
imap <M-Right> <ESC>:tabn<CR>
map <M-Left> :tabp<CR>
imap <M-Left> <ESC>:tabp<CR>

noremap <S-l> gt
noremap <S-h> gT


" NERDTree -----------------------------
" ,t
" toggle nerdtree display
" map <F3> :NERDTreeToggle<CR>
" open nerdtree with the current file selected
nmap ,t :NERDTreeFind<CR>


