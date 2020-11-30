syntax on
set nu mouse=a
set noswapfile

set tabstop=4 shiftwidth=4
set autoindent smartindent
set cindent

" Sets UTF-8 encoding
set enc=utf-8 fenc=utf-8 termencoding=utf-8

" Disables vi compatibility (emulation of old bugs)
set nocompatible

" Sets a ruler at line 80
set colorcolumn=80
colorscheme slate
" Change the ruler color, colors range from 0 (black) to 250 (white)
highlight ColorColumn ctermbg=240

" Removes all trailing whitespace by pressing f2
" If you want to understand how it works, read this:
" http://vi.stackexchange.com/a/2285
nnoremap <f2> :let _s=@/<Bar>:%s/\s\+$//e<Bar> :let @/=_s<Bar><CR>

let cf_ext=expand('%:e')
let cfamily_file=0
if cf_ext == 'c' || cf_ext == 'h' || cf_ext == 'cpp' || cf_ext == 'hpp'
	let cfamily_file=1
endif

" Vim Plug
source $SUBVIM/vimplug.vim

set showmatch showcmd ruler

set cursorline " cursorcolumn
hi CursorLine term=bold guibg=Grey40 cterm=underline,bold

"-------------------------------- MISC -----------------------------------------
noremap ' ci'
noremap " ci"
noremap ( ci(

function! VsRight()
	set splitright
	exec "vs"
endfunction

function! VsLeft()
	set splitright!
	exec "vs"
	set splitright
endfunction

function! SpUp()
	set splitbelow!
	exec "sp"
	set splitbelow
endfunction

function! SpDown()
	set splitbelow
	exec "sp"
endfunction

nnoremap <leader><Right> :call VsRight()<CR>
nnoremap <leader><Left> :call VsLeft()<CR>
nnoremap <leader><Up> :call SpUp()<CR>
nnoremap <leader><Down> :call SpDown()<CR>

if cfamily_file == 1
	source ${SUBVIM}/c.vim
elseif cf_ext == 'py'
	source ${SUBVIM}/py.vim
endif
