# linuxsty.vim

This plugin is meant to help you respecting the Linux kernel coding style,
described at: http://www.kernel.org/doc/Documentation/CodingStyle

It will automatically apply known rules to kernel related files, such as .c,
.h, Kconfig and patch files. The main rules are about indentation and syntax
error highlighting (like exceeding 80 chars).

If you have any comments, fixes or requests, feel free to contact me or send me
a patch. The development also takes place on its official [Github 
repository](https://github.com/vivien/vim-linux-coding-style).

The plugin is also available at [vim.org](www.vim.org), script ID 
[4369](http://www.vim.org/scripts/script.php?script_id=4369).
 
## Installation

You can just drop the linuxsty.vim file in your ~/.vim/plugin directory. 
Alternatively you can use the Git repository with a manager such as 
[Pathogen](https://github.com/tpope/vim-pathogen).

## Usage

By default the Linux coding style is enabled for any file known to the Linux 
project (C files, headers, patches, Kconfig, etc.).

If you prefer a finer control and apply it only on some files, define 
a "g:linuxsty_patterns" array in your vimrc and the style will be applied only 
if the buffer's path matches one of the pattern. For instance, you can match 
only projects under /usr/src/ and /linux with the following:

    let g:linuxsty_patterns = [ "/usr/src/", "/linux" ]

If you want to enable the coding style on demand without checking the filetype, 
you can use the :LinuxCodingStyle command. For instance, you can map it with 
the following in your vimrc:

    nnoremap <silent> <leader>a :LinuxCodingStyle<cr>

In oder to detect, if the coding style is applied or not there exists two
parameters per buffer. The `b:apply_linux_style` is set to 1 if the
style should be applied (e.g. the `g:linuxsty_patterns` matches).

The `b:linuxsty_applied` is on the other hand set to 1 if the `:LinuxCodingStyle`
is called and finished for the current buffer. This includes also calls by other
plugins or even manual calls.
An example how this could be useful is to set the |listchars| depending on the
`b:linuxsty_applied` state.

    function! LoadCustomStyle()
        if (exists("b:linuxsty_applied")) && b:linuxsty_applied == 1
            set listchars=tab:\ \ ,nbsp:_,trail:.
        else
            set listchars=tab:>~,nbsp:_,trail:.
        endif
    endfun
    autocmd BufEnter * :call LoadCustomStyle()


## License

Copyright (c) Vivien Didelot. Distributed under the same terms as Vim itself. 
See :help license.
