Linux Kernel Formatting for ViM
=================================
This plugin simply provides the formatting settings necessary to adhere to the
Linux Kernel coding standards, available here: https://www.kernel.org/doc/Documentation/CodingStyle

Installation
---------------------------------
Drop the plugin into your Pathogen bundle/ directory, or your personal scripts
directory. Simple!

Usage
---------------------------------
To prevent these settings from overwriting your personal settings for C and C++
files, they will *not* be auto-applied to the files you open. You must invoke
the appropriate 'SetLinuxFormatting' command to apply them. Also, changes will
only take place in your local buffer - they are *not* global settings, and there
is no way to apply them to all buffers at once, for now.

An example of mapping applying the settings using the command key:

    nnoremap <silent> <leader>k :SetLinuxFormatting<cr><cr>

Conclusion
---------------------------------
Happy hacking =)
