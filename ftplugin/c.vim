" Linux CodingStyle
"
" From an article by Bart:
" http://www.jukie.net/bart/blog/vim-and-linux-coding-style

" Indenting
set noexpandtab                         " use tabs, not spaces
set tabstop=8                           " tabstops of 8
set shiftwidth=8                        " indents of 8
set textwidth=78                        " screen in 80 columns wide, wrap at 78

set autoindent smartindent              " turn on auto/smart indenting
set smarttab                            " make <tab> and <backspace> smarter
set backspace=eol,start,indent          " allow backspacing over indent, eol, & start

"filetype plugin indent on
"nmap <C-J> vip=                         " forces (re)indentation of a block of code

" Highlighting
"syntax on
syn keyword cType uint ubyte ulong uint64_t uint32_t uint16_t uint8_t boolean_t int64_t int32_t int16_t int8_t u_int64_t u_int32_t u_int16_t u_int8_t
syn keyword cOperator likely unlikely

syn match Error /^ \+/         " highlight any leading spaces
syn match Error / \+$/         " highlight any trailing spaces
match Error     /\%>80v.\+/    " highlight anything past 80 in red

" C formatting
set formatoptions=tcqlron
set cinoptions=:0,l1,t0,g0

" Fold
"set foldmethod=syntax

" Tags
"let $kernel_version=system('uname -r | tr -d "\n"')
"set tags=./tags,tags,../tags,../../tags,../../../tags,../../../../tags,/lib/modules/$kernel_version/build/tags,/usr/include/tags
