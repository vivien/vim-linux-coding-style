" Vim plugin to fit the Linux kernel coding style and help kernel development
" Last Change:  2014 Sep 25
" Maintainer:   Vivien Didelot <vivien.didelot@savoirfairelinux.com>
" License:      Distributed under the same terms as Vim itself.
"
" This script is inspired from an article written by Bart:
" http://www.jukie.net/bart/blog/vim-and-linux-coding-style
" and various user comments.

if exists("g:loaded_linuxsty")
    finish
endif
let g:loaded_linuxsty = 1

set wildignore+=*.ko,*.mod.c,*.order,modules.builtin

augroup linuxsty
    autocmd!

    autocmd FileType c,cpp call s:LinuxFormatting()
    autocmd FileType c,cpp call s:LinuxKeywords()
    autocmd FileType c,cpp call s:LinuxHighlighting()
    autocmd FileType diff,kconfig setlocal tabstop=8
augroup END

function s:LinuxFormatting()
    setlocal tabstop=8
    setlocal shiftwidth=8
    setlocal softtabstop=8
    setlocal textwidth=80
    setlocal noexpandtab

    setlocal cindent
    setlocal formatoptions=tcqlron
    setlocal cinoptions=:0,l1,t0,g0,(0
endfunction

function s:LinuxKeywords()
    syn keyword cOperator likely unlikely
    syn keyword cType u8 u16 u32 u64 s8 s16 s32 s64
endfunction

function s:LinuxHighlighting()
    " We use an autocommand here to make sure that this styling gets applied
    " whenever the colorscheme changes. Without this, certain colorschemes
    " (such as Solarized) may override these settings when applied
    autocmd ColorScheme * highlight LinuxError ctermbg=red guibg=red ctermfg=darkred guifg=darkred
    doautocmd ColorScheme

    syn match LinuxError / \+\ze\t/     " spaces before tab
    syn match LinuxError /\%81v.\+/     " virtual column 81 and more

    " Highlight trailing whitespace, unless we're in insert mode and the
    " cursor's placed right after the whitespace. This prevents us from having
    " to put up with whitespace being highlighted in the middle of typing
    " something
    autocmd InsertEnter * match LinuxError /\s\+\%#\@<!$/
    autocmd InsertLeave * match LinuxError /\s\+$/
endfunction

" vim: ts=4 et sw=4
