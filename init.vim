"Au cas où l'on vt utiliser le fic de config vim
"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath
"source ~/.config/nvim/init.vim

let mapleader = '\'

" ============================================================================
" Plugins {{{
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

" Automatically close parenthesis, etc
" Plug 'Townk/vim-autoclose'

" Completion from other opened files
Plug 'Shougo/context_filetype.vim'

Plug 'tpope/vim-repeat'

Plug 'tomtom/tcomment_vim'

noremap <silent> <leader>cc :TComment<CR>

Plug 'tpope/vim-surround'

Plug 'sheerun/vim-polyglot'

Plug 'tpope/vim-vinegar'

" Full path fuzzy file, buffer, mru, tag, ... finder for Vim (needed for fzf).
" Plug 'kien/ctrlp.vim'

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

set laststatus=2
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

let g:netrw_list_hide= '.*\.swp$, .*\.pyc'

" Fzf ------------------------------

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'


let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }


" Tell vim-plug we finished declaring plugins, so it can load them
call plug#end()

" ============================================================================
" Install plugins the first time vim runs

if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif

" }}}

" ============================================================================
" General {{{

"set nocompatible              " required
"filetype off                  " required

"GENERAL
set mouse=a "Activer la souris
" set cursorline  "highlight current line

"COLORS
syntax on "coloration syntaxique
set colorcolumn=120 "color the line if to long
set showmatch "highlight matching [{()}]
set showcmd "show command

if has("gui_vimr")
    colorscheme solarized8
endif

" remove ugly vertical lines on window division
"set fillchars+=vert:\

"NUMBERING
"set number   "show line numbers
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

"SPACE AND TABS
"Conserve l'indentation courante sur les nouvelles lignes
set autoindent
set expandtab "Conversion des tabulations en espaces
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4

filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
" set wildmode=list:longest " NO, will prevent from autocompletion
set wildignore+=*.a,*.o,*.pyc,*~,*.swp,*.tmp

" Remove whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Autosave when switching buffers
set autowrite

"SEARCH
set incsearch "search as characters are entered
set ignorecase
set smartcase  " override the 'ignorecase' when there is uppercase letters
set hlsearch "highlight matches
nnoremap <leader><space> :nohlsearch<CR> " Disable search highlighting

set lazyredraw          " redraw only when we need to.

" SPLIT
set splitbelow
set splitright

" Close all folds when opening a new buffer
autocmd BufRead * setlocal foldmethod=marker
autocmd BufRead * normal zM
" }}}

" ============================================================================
" MAPPING {{{
noremap ; :

noremap , @@ "for the last macro

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

" }}}
