#!/bin/bash

# Set the default translation to language tag (e.g. fr for French, is for Icelandic, no for Norwegian)
DEFAULT_TO_LANG="gd"
# Check if translate-shell is installed (sudo apt install translate-shell)
if ! command -v trans &> /dev/null; then
    echo "Error: translate-shell is not installed."
    echo "Please install translate-shell using your package manager."
    exit 1
fi
# Get current clipboard content
current_text=$(xclip -o -selection clipboard 2>/dev/null)
if [[ -z "$current_text" ]]; then
    echo "Error: Clipboard is empty or cannot read clipboard content."
    exit 1
fi
# Detect the language of the text
detected_lang=$(trans -b -e google -id "$current_text" 2>/dev/null)
if [[ -z "$detected_lang" ]]; then
    echo "Error: Failed to detect language."
    exit 1
fi
# Translate the text
translation=$(trans -b -e google -s "$detected_lang" -t "$DEFAULT_TO_LANG" "$current_text" 2>/dev/null)
# Print translation result
if [[ -n "$translation" ]]; then
    echo "Original Text: $current_text"
    echo "Detected Language: $detected_lang"
    echo "Translation (${detected_lang} -> ${DEFAULT_TO_LANG}): $translation"
    echo "Copied to clipboard"
    echo ""
    # Copy translation to clipboard
    echo -n "$translation" | xclip -selection clipboard >/dev/null 2>&1
    # Send notification
    echo "Sending notification..."
    notify-send "Translation" "Original: $current_text\nDetected Language: $detected_lang\nTranslated: $translation\nCopied to clipboard"
else
    echo "Error: Translation failed."
    exit 1
fi
