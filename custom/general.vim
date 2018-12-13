"GENERAL
"set cursorline  "highlight current line
set mouse=a "Activer la souris

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

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

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
