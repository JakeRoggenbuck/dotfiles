map <leader>o :setlocal spell! spelllang=en_us<CR>
map <leader><C-s> :w<CR>:source %<CR>

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
nnoremap <silent> <leader><C-h> :call WinMove('h')<cr>
nnoremap <silent> <leader><C-j> :call WinMove('j')<cr>
nnoremap <silent> <leader><C-k> :call WinMove('k')<cr>
nnoremap <silent> <leader><C-l> :call WinMove('l')<cr>

" Git blame, at bottom
nnoremap <leader>B :<C-u>call gitblame#echo()<CR>

nmap <leader>sn :silent !command dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next <CR>
nmap <leader>sb :silent !command dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous<CR>
nmap <leader>sp :silent !command dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause<CR>

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
nmap <silent> <leader>/ :set hlsearch!<cr>

" Change current directory to the directory of the file in buffer
" Wow, i don't remember where i got this, but it's really cool
nmap <silent> <leader>cd :cd %:p:h<cr>:pwd<cr>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <silent> <leader>f :Format<CR>
