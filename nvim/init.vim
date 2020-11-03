call plug#begin('~/.vim/plugged')
" Code
Plug 'neoclide/coc.nvim', {'branch': 'master'}
Plug 'junegunn/fzf.vim'
Plug 'jakeroggenbuck/vim-snow-script-syntax'
Plug 'jakeroggenbuck/vim-impulse-syntax'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'kien/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'lervag/vimtex'

Plug 'jakeroggenbuck/vim-game-snake'

" Python
Plug 'nvie/vim-flake8'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Organization
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'

" Themes
Plug 'morhetz/gruvbox'
"Plug 'baskerville/bubblegum'
"Plug 'mhartington/oceanic-next'
Plug 'cocopon/iceberg.vim'
"Plug 'drewtempelmeyer/palenight.vim'
"Plug 'roosta/srcery'
"Plug 'joshdick/onedark.vim'
"Plug 'ajh17/spacegray.vim'

" Appearance
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/goyo.vim'

" Navigation UI
Plug 'justinmk/vim-sneak'
Plug 't9md/vim-choosewin'

" Misc
"Plug 'jakeroggenbuck/vim-character-creator'
"Plug 'jakeroggenbuck/vim-selection-test'
Plug 'dhruvasagar/vim-table-mode'
Plug 'jakeroggenbuck/vimage.vim'

call plug#end()

let mapleader =","
set relativenumber

"coc
"Confirm completion with <cr>
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"Confirm first item on <cr> if nothing is selected
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

"Use tab to navigate completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Symbol renaming.
map <leader>n <Plug>(coc-rename)

map <leader><C-s> :w<CR>:source %<CR>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Spelling
map <leader>o :setlocal spell! spelllang=en_us<CR>
map <leader>[s [sz=
map <leader>]s ]sz=
" Set splitting
set splitbelow splitright
" Tab stop
set ts=4 sw=4
set encoding=UTF-8
set history=1000
set undolevels=1000
colorscheme gruvbox
set viminfo+=n~/.config/nvim/viminfo
" Notes
let g:notes_directories = ['~/Library/vim-notes']
" Tab airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
" Sneaking
let g:sneak#label = 1
" Window selection
let g:choosewin_overlay_enable = 1
" Rainbow parentheses
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']']]

let g:tex_flavor = 'latex'
let g:vimtex_view_general_viewer = "zathura"

" Exit terminal mode
tnoremap <Esc> <C-\><C-n>

" Git Gutter updatetime
set updatetime=200

" Choose window
nmap <leader>-  <Plug>(choosewin)

let g:image_viewer = "feh"
nmap <leader>mg :call Vimage()<CR>

" Lint python using black
nmap <leader>l :execute ":!command black '" . expand('%:p') . "'"<CR>

" Pusho
nmap <leader>ps :!command git push origin $(git symbolic-ref --short HEAD)<CR>

" Lint using flake8
autocmd FileType python map <leader>lm :call flake8#Flake8()<CR>

" Calcurse md format
autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes* set filetype=markdown

" Toggle search highlighting
nmap <silent> <leader>/ :set hlsearch!<cr>

" Change current directory to the directory of the file in buffer
nmap <silent> <leader>cd :cd %:p:h<cr>:pwd<cr>

nnoremap <Leader>fu :CtrlPFunky<Cr>
let g:ctrlp_funky_syntax_highlight = 1

let g:notes_list_bullets = ['•', '◦', '▸', '▹', '▪', '▫']

" Git files/ files
nmap <leader>gf :GFiles<CR>
nmap <leader>f :Files<CR>
" Git status
nmap <leader>gs :G<CR>

" Merge conflicts
nmap <leader>gdj :diffget //3<CR>
nmap <leader>gdf :diffget //2<CR>

" Move lines
nnoremap <leader>H :m-2<cr>==
nnoremap <leader>J :m+<cr>==
xnoremap <leader>K :m-2<cr>gv=gv
xnoremap <leader>L :m'>+<cr>gv=gv

" New buffer
nnoremap <leader>B :enew<cr>

" Change buffers
nnoremap <leader><Tab> :bnext<cr>
nnoremap <leader><S-Tab> :bprevious<cr>
" Cycle between last two open buffers
nnoremap <leader><leader> <c-^>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Split window
nnoremap <silent> <leader><C-h> :call WinMove('h')<cr>
nnoremap <silent> <leader><C-j> :call WinMove('j')<cr>
nnoremap <silent> <leader><C-k> :call WinMove('k')<cr>
nnoremap <silent> <leader><C-l> :call WinMove('l')<cr>

" Move windows like window manager
function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr())
    if (match(a:key,'[jk]'))
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction

"set langmap='q,\\,w,.e,pr,yt,fy,gu,ci,ro,lp,/[,=],aa,os,ed,uf,ig,dh,hj,tk,nl,s\\;,-',\\;z,qx,jc,kv,xb,bn,mm,w\\,,v.,z/,[-,]=,\"Q,<W,>E,PR,YT,FY,GU,CI,RO,LP,?{,+},AA,OS,ED,UF,IG,DH,HJ,TK,NL,S:,_\",:Z,QX,JC,KV,XB,BN,MM,W<,V>,Z?

" Commit
nmap <leader>gc :Gcommit

nnoremap <C-p> :GFiles<CR>

set nocompatible
filetype plugin on
syntax on
