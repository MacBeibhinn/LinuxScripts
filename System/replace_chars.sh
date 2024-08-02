#!/bin/bash

# Function to replace characters, add more if needed (example: 's/oldChar/newChar/g', semicolon to break between)
replace() {
    echo $@ | sed 's/á/a/g; s/é/e/g; s/ø/o/g'
}
# Main script
if [ $# -ne 1 ]; then
    echo "Usage: $0 <text>"
    exit 1
fi
text=${1,,} # Replace "${1,,}" with "$1" to show uppercase in the output/echo; uppercase characters will then need to be defined separately in replace() or they will not be replaced
replace_text=$(replace $text)
echo "Modified text: $replace_text"
# Run in the Terminal, ensure the file can be executed as a program:
# './replace_chars.sh "this is an example text, remember quotations"'
