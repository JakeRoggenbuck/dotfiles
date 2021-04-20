"	 _         _  _            _
" 	(_) _ __  (_)| |_  __   __(_) _ __ ___
" 	| || '_ \ | || __| \ \ / /| || '_ ` _ \
" 	| || | | || || |_  _\ V / | || | | | | |
" 	|_||_| |_||_| \__|(_)\_/  |_||_| |_| |_|
"
"	By Jake Roggenbuck
"	https://github.com/JakeRoggenbuck/dotfiles
"
" 	Special thanks to Kevin and David for some
" 	of these plugins and keybinds


" Plugins
"
call plug#begin('~/.vim/plugged')
" Code
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Highlighting for specific syntaxes I use
Plug 'jakeroggenbuck/vim-snow-script-syntax'
Plug 'jakeroggenbuck/vim-impulse-syntax'
Plug 'jakeroggenbuck/planck.vim'

Plug 'jakeroggenbuck/zflat.vim'
Plug 'vim-crystal/vim-crystal'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Really helpful for code golf and other implementations with lots or
" parentheses, this highlights them to distinguishes which match up
Plug 'junegunn/rainbow_parentheses.vim'

" Similar to opening files in fzf but is really really fast, but does not
" let you search as well as fzf, good for small projects or configs
Plug 'kien/ctrlp.vim'
" A great way to navigate directories looking for files
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'

" A way to find function definitions in you current file, pretty helpful
" This plugin might be broken, or at least does not work on my machines
" Plug 'tacahiroy/ctrlp-funky'

" Great for quickly viewing and editing latex files, great for taking notes in
" class or writing papers
Plug 'lervag/vimtex'

" Needed for crystal lang to get code highlighting
Plug 'vim-crystal/vim-crystal'

" Amazing for commenting code, you don't know you need this until you have it
Plug 'tpope/vim-commentary'

" Search better
Plug 'google/vim-searchindex'

" Syntax for sxhkd
Plug 'baskerville/vim-sxhkdrc'

" For C++
Plug 'octol/vim-cpp-enhanced-highlight'

" For fun ;)
Plug 'jakeroggenbuck/vim-game-snake'

" Python
" Great extra linter to just remind me of the style
Plug 'nvie/vim-flake8'
" For python, it's got it all
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

" Pytest for vim
Plug 'alfredodeza/pytest.vim'

" Git
" Really helpful for using git with vim, it has all the needed stuff
Plug 'tpope/vim-fugitive'
" Shows the changed lines on the side of the file
Plug 'airblade/vim-gitgutter'
" Shows the commit hash, and title when <leader>b is pressed
Plug 'zivyangll/git-blame.vim'
Plug 'APZelos/blamer.nvim'
Plug 'rhysd/git-messenger.vim'

" Organization
" This is the coolest thing, in combination with other plugins, is ideal for
" taking notes in class or just reminders
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'

" 'Quickly writeup and save drafts for messaging apps in your favorite editor'
" - draft.vim
Plug 'jakeroggenbuck/draft.vim', {'branch': 'add-dragon'}

" Wrting
Plug 'reedes/vim-wordy'

" Themes
" My main theme
Plug 'morhetz/gruvbox'
" Other themes that look as cool
Plug 'baskerville/bubblegum'
Plug 'mhartington/oceanic-next'
Plug 'cocopon/iceberg.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'roosta/srcery'
Plug 'joshdick/onedark.vim'
Plug 'ajh17/spacegray.vim'

" Appearance
" The bar at the bottom that make vim super useful and look really awesome
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Great for it's intended purpose of distraction free mode, also great for
" taking screenshots of code
Plug 'junegunn/goyo.vim'

" Add hex colors
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

" Navigation UI
" Can navigate to different parts of the code
Plug 'justinmk/vim-sneak'
" Pretty cool to get around if you have lots of tabs or windows open
Plug 't9md/vim-choosewin'

Plug 'kshenoy/vim-signature'

" Misc
" Super great for making nice looking README files and other markdown files
Plug 'dhruvasagar/vim-table-mode'
" Something for opening file paths in an image viewer
Plug 'jakeroggenbuck/vimage.vim'

call plug#end()

let s:config_url = "https://raw.githubusercontent.com/JakeRoggenbuck/dotfiles/master/nvim/init.vim"
let s:config_path = "/home/jake/.config/nvim/init.vim"

" Downloads newest version of my config from github
func! g:ConfigUpdate()
py3 << EOF
import requests
import vim
config_url = vim.eval("s:config_url")
config_path = vim.eval("s:config_path")

result = requests.get(config_url)
with open(config_path, "w") as file:
	file.write(result.text)
print("Updated!")
EOF
endfunc

nnoremap <leader>cu :call ConfigUpdate()<CR>

" Chill out if I am feeling chill
let s:chill = 0

func! IsChilling()
	if s:chill
		let s:chill = 0
		colorscheme iceberg
	else
		let s:chill = 1
		colorscheme gruvbox
	endif
endfunc

call g:IsChilling()


" This is pretty interesting if you need to see all the colors that vim can
" use. This is helpful when making or fixing vim color themes or plugins that
" deal with colors. Will add ctermfg=232COLOR in every color
func! g:Colors()
	let num = 255
	while num >= 0
		exec 'hi col_'.num.' ctermfg='.num
		exec 'syn match col_'.num.' "ctermfg='.num.'COLOR" containedIn=ALL'
		call append(0, 'ctermfg='.num.'COLOR')
		let num = num - 1
	endwhile
endfunc


let mapleader =","
set number relativenumber

" Coc stuff
"
" Confirm completion with <cr>
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Confirm first item on <cr> if nothing is selected
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" Use tab to navigate completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

set hidden

" Rename symbols
map <leader>n <Plug>(coc-rename)

" Source the current file, apply vim files
map <leader><C-s> :w<CR>:source %<CR>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Spelling
"
map <leader>o :setlocal spell! spelllang=en_us<CR>
" Set splitting
set splitbelow splitright
" Tab stop
set ts=4 sw=4
set encoding=UTF-8
set history=1000
set undolevels=1000


" set colorscheme
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

" Vimtex settings
let g:tex_flavor = 'latex'
let g:vimtex_view_general_viewer = "zathura"

" Inspired by a one liner Kevin made with the same purpose of viewing github
" markdown files with one command
func! ViewGithubMarkdown()
	let name = expand('%:r')
	execute ":!command pandoc '" . expand('%:p') . "' --from=gfm --pdf-engine=wkhtmltopdf --output " . name . ".pdf"
	execute ":!command zathura '" . name . ".pdf'"
endfunc

nmap <leader>ghp :call ViewGithubMarkdown()<CR>

" Code snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" Keybinds for the plugin drafts.vim
let g:drafts_directory = "/home/jake/Library/drafts/"
nnoremap <Leader>nd :call NewDraft()<CR>
nnoremap <Leader>ld :call ListDrafts()<CR>
nnoremap <Leader>z :call OpenDrafts()<CR>

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
" Wow, i don't remember where i got this, but it's really cool
nmap <silent> <leader>cd :cd %:p:h<cr>:pwd<cr>

" Possibly broken, not sure but it's pretty cool
" nnoremap <Leader>fu :CtrlPFunky<Cr>
" let g:ctrlp_funky_syntax_highlight = 1

" Some cool symbols for notes
let g:notes_list_bullets = ['•', '◦', '▸', '▹', '▪', '▫']

" Git fugitive
"
nmap <leader>gf :GFiles<CR>
nmap <leader>f :Files<CR>
nmap <leader>gc :Gcommit
nnoremap <C-p> :GFiles<CR>

" Git status
nmap <leader>gs :G<CR>

" Merge conflicts
nmap <leader>gdj :diffget //3<CR>
nmap <leader>gdf :diffget //2<CR>

" Window and buffer stuff
"
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

" Git blame, at bottom
nnoremap <Leader>B :<C-u>call gitblame#echo()<CR>

" Highlighting of hex colors
" Test color #21a6f6
let g:highlightinghex = 0
" Plugin needs to be setup, then turned off
call hexokinase#v2#setup()
call hexokinase#v2#scraper#off()

" Toggle hex highlighting and other setting for the highlighting
func! g:HighlightingHexToggle()
	if g:highlightinghex == 0
		let g:Hexokinase_highlighters = ['sign_column']
		set termguicolors
		call hexokinase#v2#scraper#on()
		let g:highlightinghex = 1

	elseif g:highlightinghex == 1
		let g:Hexokinase_highlighters = []
		set termguicolors&
		call hexokinase#v2#scraper#off()
		let g:highlightinghex = 0
	endif
endfunc

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

" If I switch back to dvorak layout while using vim, maybe ;)
"set langmap='q,\\,w,.e,pr,yt,fy,gu,ci,ro,lp,/[,=],aa,os,ed,uf,ig,dh,hj,tk,nl,s\\;,-',\\;z,qx,jc,kv,xb,bn,mm,w\\,,v.,z/,[-,]=,\"Q,<W,>E,PR,YT,FY,GU,CI,RO,LP,?{,+},AA,OS,ED,UF,IG,DH,HJ,TK,NL,S:,_\",:Z,QX,JC,KV,XB,BN,MM,W<,V>,Z?

set nocompatible
filetype plugin on
syntax on
