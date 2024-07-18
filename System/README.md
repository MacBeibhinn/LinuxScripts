# System
Scripts that can be used system-wide for all sorts of applications.

`spell_check.sh` requires `aspell` and `xclip` to be installed, xclip is used to get the last copied clipboard item, aspell for spell checking. Copy or cut a word then run the `spell_check.sh` script.

`translate_text_auto.sh` requires `translate-shell` and `xclip` to be installed. Copy the word or sentence then run the script.

`note.sh` should be run in the Terminal and not as a keyboard shortcut, though it is possible it is not recommended, as the script is intended for managing and taking notes, it features arguments such as Edit, Delete, Copy (requires additional `xclip` package to be installed), Insert, and more, use `./note.sh help` to see a list of commands.
