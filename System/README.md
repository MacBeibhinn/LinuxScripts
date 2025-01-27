# System
Scripts that can be used system-wide for all sorts of applications.

`spell_check.sh` requires `aspell` and `xclip` to be installed, xclip is used to get the last copied clipboard item, aspell for spell checking. Copy or cut a word then run the `spell_check.sh` script.

`translate_text_auto.sh` requires `translate-shell` and `xclip` to be installed. Copy the word or sentence then run the script.

`note.sh` should be run in the Terminal and not as a keyboard shortcut, though it is possible it is not recommended, as the script is intended for managing and taking notes, it features arguments such as Edit, Delete, Copy (requires additional `xclip` package to be installed), Insert, and more, use `./note.sh help` to see a list of commands. Supports encrypting files using `openssl`, which may require manual installation.

To run `note.sh` in the terminal without requiring `.sh`, so you can use `./note <new_note>` instead of `./note.sh <new_note>`:
- Navigate to the directory containing the file.
- Open the directory in the terminal (or open the terminal and use `cd PathToDirectory`).
- Enter the following commands; `ln -s note.sh note`, `chmod +x note`.

`replace_chars.sh` requires the text to be wrapped in quotations ("example"), else it will fail, single words will work fine but using multiple words without quotations will return the usage example. By default will output lowercase characters, this can be changed by editing the file (see the comments in the file to learn more).

`calc.sh` can be used with quotations and spaces (`./calc.sh "2 + 2"`), or without quotations and spaces (`./calc.sh 2+2`).

`open_and_kill.sh` was originally created to allow users to temporarily open the file application Dolphin, select a file and have Dolphin automatically close shortly after no longer needing it to be manually closed. It can be used for anything however, and works well as a keyboard shortcut to a notes folder.
