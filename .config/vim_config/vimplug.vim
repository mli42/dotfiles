" Vim Plug
if empty(glob('~/.vim/autoload/plug.vim'))
	echo "Installing VimPlug..."
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')

" Plug 'ycm-core/YouCompleteMe' " Compatibility issues with syntastic
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Use release branch

Plug 'vim-syntastic/syntastic'

" Used

" Plug 'ryanoasis/vim-devicons' " Dev Icons for NerdTree
Plug 'ekalinin/Dockerfile.vim' " Dockerfile syntax
" Plug 'scrooloose/nerdcommenter'
" Plug 'mbbill/undotree'
" Plug 'junegunn/vim-easy-align'
" Plug 'easymotion/vim-easymotion'

" Used - end

Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim' " Light footer
Plug 'sheerun/vim-polyglot' " Syntax highlight
Plug 'terryma/vim-multiple-cursors' " Ctrl+{n/x/...}
Plug 'drewtempelmeyer/palenight.vim' " Theme
Plug 'kien/rainbow_parentheses.vim'
Plug 'pbondoer/vim-42header'

" Plug 'davidhalter/jedi-vim' " Python Autocompletion
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'Lenovsky/nuake' " Open a Terminal
" Plug 'brookhong/cscope.vim' " IDK
" Plug 'thaerkh/vim-workspace'
" Plug 'arcticicestudio/nord-vim'
" Plug 'mattn/emmet-vim'
" Plug 'christoomey/vim-tmux-navigator'
" Plug 'elixir-editors/vim-elixir'
" Plug 'mhinz/vim-mix-format'
" Plug 'edkolev/tmuxline.vim'
" Plug 'rbgrouleff/bclose.vim'
" Plug 'francoiscabrol/ranger.vim'
" Plug 'jparise/vim-graphql'
" Plug 'mxw/vim-jsx'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'rizzatti/dash.vim'
" Plug 'vim-scripts/Align'

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
" https://pycodestyle.pycqa.org/en/latest/intro.html#error-codes
" let g:syntastic_mode_map = { 'passive_filetypes': ['python'] } " Disable for python
let g:syntastic_python_checkers=["flake8 --ignore=E225,E501,E302,E261,E262,E701,E241,E126,E127,E128,W801", "python3"]

"-------------------------------- COC ------------------------------------------
" Install nodejs >= 10.12: https://nodejs.org/en/download/
" Then :CocInstall coc-json coc-tsserver
source ${MY_CONFIG}/coc.vim
"-------------------------------- YCM ------------------------------------------
let g:ycm_error_symbol = '✖'
let g:ycm_warning_symbol = '!'
let g:ycm_autoclose_preview_window_after_completion = 1

if (cf_ext == "c" || cf_ext == "h")
	let g:ycm_global_ycm_extra_conf = $MY_SUBVIM/'ycm_c.py'
elseif (cf_ext == "cpp" || cf_ext == "hpp")
	let g:ycm_global_ycm_extra_conf = $MY_SUBVIM/'ycm_cpp.py'
endif

"-------------------------------- NerdTreeToggle--------------------------------
let NERDTreeShowHidden=1 " Shift + I to unable hidden files
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

set background=dark
colorscheme palenight
let g:palenight_terminal_italics=1
