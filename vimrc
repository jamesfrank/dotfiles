" escape is too far from the home row
imap jj <esc>

" powerline looks much nicer this way
let g:Powerline_symbols = 'unicode' " 'fancy' or 'unicode'

" lets powerline colors work
set term=xterm-256color

" spell checking is unhelpful
let g:Spell = 0

" spaces, not tabs
set autoindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set smarttab

" line numbers are nice
set nu

" remap multiple-cursors key to be like Sublime
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_next_key = '<C-d>'
let g:multi_cursor_prev_key = '<C-p>'
let g:multi_cursor_skip_key = '<C-x>'
let g:multi_cursor_quit_key = '<Esc>'

" set colorscheme
colorscheme tir_black
"colorscheme szakdark
"colorscheme neverness
"colorscheme fu "bg color
"colorscheme jellybeans "bg color
"colorscheme sorcerer "bg color

" show extra command info
set showcmd

" create temp files in ~/.vim-tmp and ~/.vim-swap (directories must exist)
set backup
set backupdir=~/.vim-tmp//
set directory=~/.vim-swap//

" enable cursor line highlighting, but for current window only
set cursorline
au WinLeave * set nocursorline
au WinEnter * set cursorline

" setup syntastic
leg g:syntastic_mode_map = {
	\ 'mode': 'passive',
	\ 'active_filetypes': ['c','h','py','rst'],
	\ 'passive_filetypes: []
	\ }
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_aggregate_errors = 0
let g:syntastic_enable_balloons = 1
let g:syntastic_c_remove_include_errors = 1
"let g:syntastic_c_compiler = 'clang'
