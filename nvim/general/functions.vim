" Chill out if I am feeling chill
let s:chill = 0

func! g:IsChilling()
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

let g:Illuminate_highlightUnderCursor = 0
" Starts disabled, can be turned on manually when needed
call g:illuminate#disable_illumination(0)

" Move windows like window manager
func! g:WinMove(key)
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

func! ViewGithubMarkdown()
	let name = expand('%:r')
	execute ":!command pandoc '" . expand('%:p') . "' --from=gfm --pdf-engine=wkhtmltopdf --output /tmp/" . name . ".pdf"
	execute ":!command zathura '/tmp/" . name . ".pdf'"
endfunc
