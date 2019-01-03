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

" Snippet ------------------------------
Plug 'Valloric/YouCompleteMe' " fuzzy-code-completion engine
Plug 'SirVer/ultisnips' " snippet manager for Vim
Plug 'honza/vim-snippets' " snippets files for various programming languages

let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


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

set nocompatible              " required
"filetype off                  " required

set noshowmode

"GENERAL
set mouse=a "Activer la souris
" set cursorline  "highlight current line

" UTF encoding
set encoding=utf-8

" Autoload files that have changed outside of vim
set autoread

" Use system clipboard
" http://stackoverflow.com/questions/8134647/copy-and-paste-in-vim-via-keyboard-between-different-mac-terminals
set clipboard+=unnamed

" Don't show intro
set shortmess+=I

"COLORS
syntax on "coloration syntaxique
set colorcolumn=120 "color the line if to long
set showmatch "highlight matching [{()}]
set showcmd "show command

autocmd Bufread,BufNewFile *.md set filetype=markdown " Vim interprets .md as 'modula2' otherwise, see :set filetype?

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

" Always highlight column 80 so it's easier to see where
" cutoff appears on longer screens
autocmd BufWinEnter * highlight ColorColumn ctermbg=lightgreen
set colorcolumn=100
" }}}


" STATUS LINE
set laststatus=2

" Dictionary: take mode() input -> longer notation of current mode
" mode() is defined by Vim
let g:currentmode={
      \ 'n'  : 'Normal',
      \ 'no' : 'N·Operator Pending',
      \ 'v'  : 'Visual',
      \ 'V'  : 'Visual-Line',
      \ 'x22' : 'Visual-Block',
      \ 'i'  : 'Insert',
      \ 'R'  : 'Replace',
      \ 'Rv' : 'V·Replace ',
      \ 'c'  : 'Command',
      \ 'cv' : 'Vim Ex',
      \ 'rm' : 'More',
      \ 'r?' : 'Confirm',
      \ '!'  : 'Shell',
      \ 't'  : 'Terminal'
\}


" Function: return current mode
" abort -> function will abort soon as error detected
function! ModeCurrent() abort
    let l:modecurrent = mode()
    let l:modelist = toupper(get(g:currentmode, l:modecurrent, 'V·Block'))
    let l:current_status_mode = l:modelist
    return l:current_status_mode
endfunction

" Find out current buffer's size and output it.
function! FileSize()
  let bytes = getfsize(expand('%:p'))
  if (bytes >= 1024)
    let kbytes = bytes / 1024
  endif
  if (exists('kbytes') && kbytes >= 1000)
    let mbytes = kbytes / 1000
  endif

  if bytes <= 0
    return '0'
  endif

  if (exists('mbytes'))
    return mbytes . 'MB'
  elseif (exists('kbytes'))
    return kbytes . 'KB'
  else
    return bytes . 'B'
  endif
endfunction

" left side
set statusline=
set statusline+=\ %{ModeCurrent()}
set statusline+=\ \|\ " Separator
set statusline+=%f\ [%{FileSize()}] " file name
set statusline+=\ \|\ " Separator
set statusline+=%y " file type
set statusline+=\ \|\ " Separator
set statusline+=[%b][0x%B] " Char under cursor
set statusline+=\ \|\ " Separator
" ------------------------------
set statusline+=%= " switching to right side
set statusline+=\|\ " Separator
set statusline+=L:\ %l\ of\ %L\ [%p%%] " current line and total of lines
set statusline+=\ \|\ " Separator
set statusline+=C:\ %c " Column
set statusline+=\ \|\ " Separator
set statusline+=B:\ %n " Buffer number
set statusline+=\ \|\ " Separator
set statusline+=%{(&fenc!=''?&fenc:&enc)} " encoding
set statusline+=\ \|\ " Separator


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
nnoremap <leader>f :FZF<CR>
" list open buffers
nnoremap <leader>b :Buffers<CR>
" commands finder mapping (all commands)
nnoremap <leader>c :Commands<CR>
" general code finder in current file mapping (find line. nice)
nnoremap <leader>l :BLines<CR>
" Lines in loaded buffers
nnoremap <leader>L :Lines<CR>
" File System Explorer (in horizontal split)
nnoremap <leader>. :Sexplore<cr>

" }}}
