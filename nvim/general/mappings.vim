map <leader>o :setlocal spell! spelllang=en_us<CR>
map <leader><C-s> :w<CR>:source %<CR>

" Move lines
nnoremap <leader>H :m-2<CR>==
nnoremap <leader>J :m+<CR>==
xnoremap <leader>K :m-2<CR>gv=gv
xnoremap <leader>L :m'>+<CR>gv=gv

" New buffer
nnoremap <leader>B :enew<CR>

" Change buffers
nnoremap <leader><Tab> :bnext<CR>
nnoremap <leader><S-Tab> :bprevious<CR>

" Cycle between last two open buffers
nnoremap <leader><leader> <c-^>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Git fugitive
nmap <leader>gf :GFiles<CR>
nmap <leader>f :Files<CR>
nmap <leader>gc :Gcommit
nnoremap <C-p> :GFiles<CR>

" Git status
nmap <leader>gs :G<CR>

" Merge conflicts
nmap <leader>gdj :diffget //3<CR>
nmap <leader>gdf :diffget //2<CR>

" Split window
nnoremap <silent> <leader><C-h> :call WinMove('h')<CR>
nnoremap <silent> <leader><C-j> :call WinMove('j')<CR>
nnoremap <silent> <leader><C-k> :call WinMove('k')<CR>
nnoremap <silent> <leader><C-l> :call WinMove('l')<CR>

" Git blame, at bottom
nnoremap <leader>B :<C-u>call gitblame#echo()<CR>

nmap <silent><leader>sn :silent !command dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next <CR>
nmap <silent><leader>sb :silent !command dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous<CR>
nmap <silent><leader>sp :silent !command dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause<CR>

nmap <leader>ghp :call ViewGithubMarkdown()<CR>

" Exit terminal mode
tnoremap <Esc> <C-\><C-n>

" Choose window
nmap <leader>- <Plug>(choosewin)

" Lint python using black
nmap <leader>l :execute ":!command black '" . expand('%:p') . "'"<CR>

" Pusho
nmap <leader>ps :!command git push origin $(git symbolic-ref --short HEAD)<CR>

" Turn Ditto on and off
nmap <leader>di <Plug>ToggleDitto

" Toggle search highlighting
nmap <silent> <leader>/ :set hlsearch!<CR>

" Change current directory to the directory of the file in buffer
" Wow, i don't remember where i got this, but it's really cool
nmap <silent> <leader>cd :cd %:p:h<CR>:pwd<CR>

nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<CR>
nnoremap <leader>fb <cmd>Telescope buffers<CR>
nnoremap <leader>fh <cmd>Telescope help_tags<CR>

nnoremap <silent> <leader>f :Format<CR>

nnoremap <F5> :lua require("nabla").action()<CR>

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

nnoremap <silent>K :Lspsaga hover_doc<CR>
nnoremap <silent>gr :Lspsaga rename<CR>
nnoremap <silent><leader>gd :Lspsaga preview_definition<CR>

nnoremap <leader>xx <cmd>TroubleToggle<CR>
nnoremap <leader>xw <cmd>TroubleToggle lsp_workspace_diagnostics<CR>
nnoremap <leader>xd <cmd>TroubleToggle lsp_document_diagnostics<CR>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<CR>
nnoremap <leader>xl <cmd>TroubleToggle loclist<CR>
nnoremap gR <cmd>TroubleToggle lsp_references<CR>

nnoremap <leader>so :SymbolsOutline<CR>

" Move to previous/next
nnoremap <silent>    <A-,> :BufferPrevious<CR>
nnoremap <silent>    <A-.> :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
nnoremap <silent>    <A->> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <A-1> :BufferGoto 1<CR>
nnoremap <silent>    <A-2> :BufferGoto 2<CR>
nnoremap <silent>    <A-3> :BufferGoto 3<CR>
nnoremap <silent>    <A-4> :BufferGoto 4<CR>
nnoremap <silent>    <A-5> :BufferGoto 5<CR>
nnoremap <silent>    <A-6> :BufferGoto 6<CR>
nnoremap <silent>    <A-7> :BufferGoto 7<CR>
nnoremap <silent>    <A-8> :BufferGoto 8<CR>
nnoremap <silent>    <A-9> :BufferLast<CR>
" Close buffer
nnoremap <silent>    <A-c> :BufferClose<CR>
" Magic buffer-picking mode
nnoremap <silent> <C-s>    :BufferPick<CR>
" Sort automatically by...
nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>C
