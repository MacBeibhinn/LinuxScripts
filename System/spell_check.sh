#!/bin/bash

# Script for spell checking the last copied clipboard item, copy or cut a word then run the script.
# Set the desired language for aspell ('sudo apt install aspell')
# Default language can be set here. Modify this variable to set your preferred language.
# For example, set it to "fr" for French, "en" for English, or "gd" for Scottish Gaelic.
DEFAULT_LANGUAGE="en"
# You can override the default language by passing a language code as an argument to the script.
# For example: ./spell_check.sh fr (to use French)
# If no language is specified, it defaults to the language set in DEFAULT_LANGUAGE.
LANGUAGE=${1:-$DEFAULT_LANGUAGE}
# Example of language tags (if installed):
# - en (English)
# - fr (French)
# - es (Spanish)
# - de (German)
# - it (Italian)
# - pt (Portuguese)
# - ru (Russian)
# - zh (Chinese)
# - ja (Japanese)
# - ko (Korean)
# For languages not available or installed,
# you may need to manually download and install the dictionary (under Latest Dictionary) from:
# https://ftp.gnu.org/gnu/aspell/dict/0index.html
# Example for installing Scottish Gaelic dictionary (gd):
# 1. Download the dictionary package (e.g., aspell5-gd-0.1.1-1.tar.bz2)
# 2. Extract the package: tar -xvjf aspell5-gd-0.1.1-1.tar.bz2
# 3. Navigate into the extracted directory: cd aspell5-gd-0.1.1-1
# 4. Install the dictionary: './configure', and 'sudo make install'
# After installation, set LANGUAGE="gd" in this script to use Scottish Gaelic.
# Get the selected word from the clipboard
selected_word=$(xclip -o -selection clipboard)
# Debugging: Print the selected word and language to the console
echo "Selected word: '$selected_word'"
echo "Language: '$LANGUAGE'"
# Check the spelling using aspell with the specified language dictionary
result=$(echo "$selected_word" | aspell -a -d "$LANGUAGE")
# Debugging: Print the aspell result to the console
echo "Aspell result: $result"
# Extract the relevant part of the aspell output
correct_word=false
suggestions=""
while IFS= read -r line; do
    # Debugging: Print each line of aspell output
    echo "Processing line: $line"
    # If the line starts with '*', it means the word is correct
    if [[ $line == \** ]]; then
        correct_word=true
        break
    elif [[ $line == \&* ]]; then
        # Extract suggestions if the line starts with '&'
        suggestions=$(echo "$line" | awk -F': ' '{print $2}' | awk -F', ' '{print $0}')
    fi
done <<< "$result"
# Debugging: Print whether the word is correct and suggestions
echo "Correct word: $correct_word"
echo "Suggestions: $suggestions"
if $correct_word; then
    notify-send "Spelling Check" "The word '$selected_word' is correct."
else
    if [ -z "$suggestions" ]; then
        suggestions="No suggestions available."
    fi
    notify-send "Spelling Check" "The word '$selected_word' is incorrect. Suggestions: $suggestions"
fi
