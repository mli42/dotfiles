syntax on
set nu
set mouse=a
set noswapfile

set tabstop=4
set shiftwidth=4

set autoindent
set smartindent
set cindent

" Sets UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

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

" Vim Plug
if empty(glob('~/.vim/autoload/plug.vim'))
	echo "Installing VimPlug..."
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')
Plug 'pbondoer/vim-42header'
call plug#end()

" 42 Header
" nmap <f1> :Stdheader<CR>

set showmatch
set showcmd
set ruler
