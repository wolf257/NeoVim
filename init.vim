"Au cas où l'on vt utiliser le fic de config vim
"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath
"source ~/.config/nvim/init.vim

let mapleader = '\'

" Plugins
source ~/.config/nvim/custom/plugins.vim

""""""""""""""""""""""""""""""""""""""""""""""""
"                   SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""

"set nocompatible              " required
"filetype off                  " required

" General
source ~/.config/nvim/custom/general.vim

" MAPPING
source ~/.config/nvim/custom/map.vim
