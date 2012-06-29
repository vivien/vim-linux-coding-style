" Linux CodingStyle
"
" From an article by Bart:
" http://www.jukie.net/bart/blog/vim-and-linux-coding-style

set noexpandtab  " use tabs, not spaces
set tabstop=8    " indetation is 8-space long
set shiftwidth=8
set textwidth=80 " 80 chars max

set autoindent
set cindent
set formatoptions=tcqlron
set cinoptions=:0,l1,t0,g0

syn keyword cOperator likely unlikely
syn keyword cType uint ubyte ulong uint64_t uint32_t uint16_t uint8_t boolean_t int64_t int32_t int16_t int8_t u_int64_t u_int32_t u_int16_t u_int8_t
syn keyword cType u8 u16 u32 u64 s8 s16 s32 s64
syn keyword cType wait_queue_head_t atomic_t

syn match Error /^ \+/         " highlight any leading spaces
syn match Error / \+$/         " highlight any trailing spaces
match Error     /\%>80v.\+/    " highlight anything past 80
