let g:startify_session_dir = '~/.config/nvim/session'

let g:startify_lists = [
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ ]

let g:startify_bookmarks = [
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'b': '~/.bashrc' },
            \ { 'd': g:drafts_directory },
            \ { 'm': '~/.config/nvim/general/mappings.vim' },
            \ { 'f': '~/.config/nvim/general/functions.vim' },
            \ { 's': '~/Repos/ideas/README.md' },
            \ ]

let g:startify_custom_header = [
        \ '       _  __     _     ',
        \ '      / |/ /  __(_)_ _ ',
        \ '     /    / |/ / /  ` \',
        \ '    /_/|_/|___/_/_/_/_/',
		\]

