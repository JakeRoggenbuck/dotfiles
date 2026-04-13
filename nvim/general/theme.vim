" Chill out if I am feeling chill
let s:chill = 0

func! g:IsChilling()
	if s:chill
		let s:chill = 0
		colorscheme iceberg
	else
		let s:chill = 1
		" set background = "light"
		"
		let g:everforest_background = 'hard'
		colorscheme everforest

		if has('termguicolors')
			set termguicolors
		endif

		" colorscheme nord
		" colorscheme iceberg
		" colorscheme onedark
		"
		" colorscheme gruvbox
		" let g:gruvbox_contrast_light = "soft"
		"
		" colorscheme bubblegum-256-light
	endif
endfunc

call g:IsChilling()
