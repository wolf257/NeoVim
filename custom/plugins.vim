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
