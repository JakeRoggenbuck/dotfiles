" Chill out if I am feeling chill
let s:chill = 0

func! g:IsChilling()
	if s:chill
		let s:chill = 0
		colorscheme iceberg
	else
		let s:chill = 1
		" let g:gruvbox_contrast_light = "soft"
		" set background = "light"
		"
		colorscheme everforest
		" colorscheme nord
		" colorscheme iceberg
		" colorscheme onedark
		" colorscheme gruvbox
		" colorscheme bubblegum-256-light
	endif
endfunc

call g:IsChilling()
