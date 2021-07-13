set backspace=indent,eol,start
function! NewPythonFileIndent()
	set tabstop=4 shiftwidth=4 expandtab
endfunction
nnoremap <leader>n :call NewPythonFileIndent()<CR>
"call NewPythonFileIndent() " Useless bc?
"set noexpandtab to use Tabs to indent
