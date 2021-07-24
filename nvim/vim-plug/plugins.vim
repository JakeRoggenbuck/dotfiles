call plug#begin('~/.vim/plugged')

" Highlighting for specific syntaxes I use
Plug 'baskerville/vim-sxhkdrc'
Plug 'jakeroggenbuck/planck.vim'
Plug 'jakeroggenbuck/vim-impulse-syntax'
Plug 'jakeroggenbuck/vim-snow-script-syntax'
Plug 'jakeroggenbuck/zflat.vim'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'pangloss/vim-javascript'
Plug 'rust-lang/rust.vim'
Plug 'udalov/kotlin-vim'
Plug 'vim-crystal/vim-crystal'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'mattn/emmet-vim'

" Lua and LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

" Really helpful for code golf and other implementations with lots or
" parentheses, this highlights them to distinguishes which match up
Plug 'junegunn/rainbow_parentheses.vim'

" Similar to opening files in fzf but is really really fast, but does not
" let you search as well as fzf, good for small projects or configs
Plug 'kien/ctrlp.vim'
" A great way to navigate directories looking for files
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'

" Great for quickly viewing and editing latex files, great for taking notes in
" class or writing papers
Plug 'lervag/vimtex'

" Amazing for commenting code, you don't know you need this until you have it
Plug 'tpope/vim-commentary'

" Search better
Plug 'google/vim-searchindex'

Plug 'jakeroggenbuck/vim-game-snake'

" Python
Plug 'nvie/vim-flake8'
" For python, it's got it all
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }


" Pytest for vim
Plug 'alfredodeza/pytest.vim'

Plug 'RRethy/vim-illuminate'

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

Plug 'mhinz/vim-startify'

" 'Quickly writeup and save drafts for messaging apps in your favorite editor'
" - draft.vim
Plug 'jakeroggenbuck/draft.vim', {'branch': 'add-dragon'}
Plug 'jakeroggenbuck/journal.vim'

" Wrting
Plug 'reedes/vim-wordy'
Plug 'reedes/vim-pencil'
Plug 'dbmrq/vim-ditto'
Plug 'preservim/vim-lexical'
Plug 'preservim/vim-textobj-sentence'

" Themes
" My main theme
Plug 'morhetz/gruvbox'

" Other themes that look as cool
Plug 'ajh17/spacegray.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'baskerville/bubblegum'
Plug 'cocopon/iceberg.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'gkjgh/cobalt'
Plug 'itchyny/landscape.vim'
Plug 'joshdick/onedark.vim'
Plug 'mhartington/oceanic-next'
Plug 'roosta/srcery'

" Appearance
" The bar at the bottom that make vim super useful and look really awesome
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Great for it's intended purpose of distraction free mode, also great for
" taking screenshots of code
Plug 'junegunn/goyo.vim'

" Add hex colors
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

" Pretty cool to get around if you have lots of tabs or windows open
Plug 't9md/vim-choosewin'

Plug 'kshenoy/vim-signature'

" Misc
" Super great for making nice looking README files and other markdown files
Plug 'dhruvasagar/vim-table-mode'
" Something for opening file paths in an image viewer
Plug 'jakeroggenbuck/vimage.vim'

call plug#end()
