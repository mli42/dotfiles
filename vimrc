" For Vundle
"set nocompatible  " be iMproved, required
"filetype off      " required

" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()

" Plugin 'VundleVim/Vundle.vim' " For Vundle itself
" Plugin 'ycm-core/YouCompleteMe'

"call vundle#end()            " required
"filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
"  Was for Vundle

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

" Plug 'ycm-core/YouCompleteMe' " Compatibility issues with syntastic
Plug 'vim-syntastic/syntastic'
" Plug 'davidhalter/jedi-vim' " Python Autocompletion
Plug 'scrooloose/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'Lenovsky/nuake' " Open a Terminal
" Plug 'pandark/42header.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'itchyny/lightline.vim'
" Plug 'brookhong/cscope.vim' " IDK
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdcommenter'
Plug 'mbbill/undotree'
Plug 'terryma/vim-multiple-cursors'
" Plug 'thaerkh/vim-workspace'
Plug 'drewtempelmeyer/palenight.vim'
" Plug 'arcticicestudio/nord-vim'
" Plug 'mattn/emmet-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'
Plug 'edkolev/tmuxline.vim'
" Plug 'rbgrouleff/bclose.vim'
" Plug 'francoiscabrol/ranger.vim'
Plug 'junegunn/vim-easy-align'
Plug 'jparise/vim-graphql'
" Plug 'mxw/vim-jsx'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'rizzatti/dash.vim'
Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/Align'
Plug 'kien/rainbow_parentheses.vim'

Plug 'pbondoer/vim-42header'

Plug 'neoclide/coc.nvim', {'branch': 'release'} " Use release branch (recommend)
call plug#end()

"-------------------------------- SYNTASTIC ------------------------------------
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_loc_list_height = 10
let g:syntastic_error_symbol = '✖'
let g:syntastic_style_error_symbol = '✖'
let g:syntastic_warning_symbol = '!'
let g:syntastic_style_warning_symbol = '!'
let g:syntastic_enable_highlighting = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_c_include_dirs = ['includes', 'libft/includes', '../includes', '../libft/includes', './libft', '../']

"-------------------------------- COC ------------------------------------------
" Install nodejs >= 10.12: https://nodejs.org/en/download/
" Then :CocInstall coc-json coc-tsserver
source ${MY_CONFIG}/coc.vim
"-------------------------------- YCM ------------------------------------------
let g:ycm_error_symbol = '✖'
let g:ycm_warning_symbol = '!'
let g:ycm_global_ycm_extra_conf = '~/dotfiles/.config/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1

"-------------------------------- NerdTreeToggle--------------------------------
nmap <C-a> :NERDTreeToggle<CR>
" Open a NERDTree automatically when vim starts up
" autocmd vimenter * NERDTree
" Close if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Automatic when no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"-------------------------------- NUAKE ----------------------------------------
nnoremap <F4> :Nuake<CR>
inoremap <F4> <C-\><C-n>:Nuake<CR>
tnoremap <F4> <C-\><C-n>:Nuake<CR>

"-------------------------------- LightLine ------------------------------------
set laststatus=2
set noshowmode
let g:lightline = {'colorscheme': 'seoul256'}

"-------------------------------- NERDCommenter --------------------------------
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCustomDelimiters = { 'c': { 'left': '/**', 'right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

"-------------------------------- Rainbow Parentheses --------------------------
let g:rbpt_colorpairs = [
	\ ['brown',			'RoyalBlue3'],
	\ ['blue',			'DarkOrchid3'],
	\ ['darkgreen',		'RoyalBlue3'],
	\ ['darkcyan',		'RoyalBlue3'],
	\ ['darkred',		'SeaGreen3'],
	\ ]
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
"-------------------------------------------------------------------------------
" 42 Header
" nmap <f1> :Stdheader<CR>
" <F2> => No WhiteSpaces

" <F4> => Nuake
nnoremap <F5> :UndotreeToggle<CR>

set showmatch
set showcmd
set ruler

set background=dark
colorscheme palenight
let g:palenight_terminal_italics=1

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

iabbrev mainc int		main(int argc, char **argv)<CR>{<CR>(void)argc; (void)argv;<CR>}<ESC>O
nnoremap <leader><Right> :call VsRight()<CR>
nnoremap <leader><Left> :call VsLeft()<CR>
nnoremap <leader><Up> :call SpUp()<CR>
nnoremap <leader><Down> :call SpDown()<CR>

iabbrev inc" #include " .h"<ESC>3hc
iabbrev inc< #include < .h><ESC>3hc
iabbrev def# # define
