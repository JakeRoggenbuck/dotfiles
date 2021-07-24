"     _  __     _     
"    / |/ /  __(_)_ _ 
"   /    / |/ / /  ` \
"  /_/|_/|___/_/_/_/_/
"
"	By Jake Roggenbuck
"	http://link.jr0.org/nvim

let mapleader =","

set number relativenumber
set hidden
set splitbelow splitright
set ts=4 sw=4
set encoding=UTF-8
set history=1000
set undolevels=1000
set nocompatible

set viminfo+=n~/.config/nvim/viminfo

" Vim plug list
source ~/.config/nvim/vim-plug/plugins.vim

" General configuration
source ~/.config/nvim/general/functions.vim
source ~/.config/nvim/general/mappings.vim

" Configuration for individual plugins
source ~/.config/nvim/plug-config/airline.vim
source ~/.config/nvim/plug-config/choosewin.vim
source ~/.config/nvim/plug-config/ditto.vim
source ~/.config/nvim/plug-config/drafts.vim
source ~/.config/nvim/plug-config/journal.vim
source ~/.config/nvim/plug-config/lsp-config.vim
source ~/.config/nvim/plug-config/notes.vim
source ~/.config/nvim/plug-config/rainbow.vim
source ~/.config/nvim/plug-config/sneak.vim
source ~/.config/nvim/plug-config/startify.vim
source ~/.config/nvim/plug-config/ultisnips.vim
source ~/.config/nvim/plug-config/vimtex.vim

luafile ~/.config/nvim/lua/plugins/compe-config.lua

" Individual language servers
luafile ~/.config/nvim/lsp/bash-lsp.lua
luafile ~/.config/nvim/lsp/go-lsp.lua
luafile ~/.config/nvim/lsp/julias-lsp.lua
luafile ~/.config/nvim/lsp/python-lsp.lua
luafile ~/.config/nvim/lsp/rust-lsp.lua
luafile ~/.config/nvim/lsp/typescript-lsp.lua
luafile ~/.config/nvim/lsp/yaml-lsp.lua

" Change color of spelling error
autocmd ColorScheme * hi SpellBad cterm=Underline ctermfg=203

" Turn on Ditto's autocmds
autocmd FileType markdown,text,tex DittoOn

filetype plugin on
syntax on
