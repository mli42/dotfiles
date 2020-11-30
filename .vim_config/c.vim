iabbrev def# # define
iabbrev mainc int<TAB><TAB>main(int argc, char **argv)<CR>{<CR>(void)argc; (void)argv;<CR>}<ESC>O

if (cf_ext == 'c')
	iabbrev inc" #include " .h"<ESC>3hc
	iabbrev inc< #include < .h><ESC>3hc
elseif (cf_ext == 'h')
	iabbrev inc" # include " .h"<ESC>3hc
	iabbrev inc< # include < .h><ESC>3hc
elseif (cf_ext == 'cpp')
	iabbrev inc" #include " .hpp"<ESC>5hc
	iabbrev inc< #include < ><ESC>1hc
elseif (cf_ext == 'hpp')
	iabbrev inc" # include " .hpp"<ESC>5hc
	iabbrev inc< # include < ><ESC>1hc
endif
