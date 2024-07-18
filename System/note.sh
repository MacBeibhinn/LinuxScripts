#!/bin/bash

notes_dir=~/Desktop/Notes

# Create Notes directory if it doesn't exist
if [ ! -d "$notes_dir" ]; then
    mkdir -p "$notes_dir"
fi

if [ "$1" == "edit" ]; then
    if [ -f "$notes_dir/note$2.txt" ]; then
        note_text="${@:3}"
        echo "$note_text" > "$notes_dir/note$2.txt"
        echo "Note $2 edited."
    else
        echo "Note $2 does not exist."
    fi
elif [ "$1" == "delete" ]; then
    if [ -f "$notes_dir/note$2.txt" ]; then
        rm "$notes_dir/note$2.txt"
        echo "Note $2 deleted."
    else
        echo "Note $2 does not exist."
    fi
elif [ "$1" == "read" ]; then
    note_number=$2
    password=$3
    if [ -f "$notes_dir/note$note_number.enc" ]; then
        # Decrypt the encrypted note file with the provided password
        decrypted_content=$(openssl enc -d -aes-256-cbc -in "$notes_dir/note$note_number.enc" -k "$password" -pbkdf2 2>/dev/null)
        if [ -n "$decrypted_content" ]; then
            echo "$decrypted_content"
        else
            echo "Incorrect password or unable to decrypt the note."
        fi
    else
        echo "Note $note_number does not exist or is not password protected."
    fi
elif [ "$1" == "insert" ]; then
    note_number=$2
    note_text="${@:3}"
    if [ -f "$notes_dir/note$note_number.txt" ]; then
        echo "Note $note_number already exists. Use a different number or edit the existing note."
    else
        echo "$note_text" > "$notes_dir/note$note_number.txt"
        echo "Note $note_number inserted."
    fi
elif [ "$1" == "copy" ]; then
    if [ -f "$notes_dir/note$2.txt" ]; then
        cat "$notes_dir/note$2.txt" | xclip -selection clipboard
        echo "Note $2 copied to clipboard."
    else
        echo "Note $2 does not exist."
    fi
elif [ "$1" == "deleteall" ]; then
    read -p "Are you sure you want to delete all notes? (y/n): " confirm
    if [ "$confirm" == "y" ]; then
        rm -f "$notes_dir"/*
        echo "All notes deleted."
    else
        echo "Deletion canceled."
    fi
elif [ "$1" == "ls" ]; then
    note_count=$(ls -l "$notes_dir" | grep -c '^-' )
    echo "Total number of notes: $note_count"
elif [ "$1" == "open" ]; then
    nohup xdg-open "$notes_dir" >/dev/null 2>&1 &
    echo "Notes folder opened."
elif [ "$1" == "pw" ]; then
    note_number=$2
    password=$3
    if [ -f "$notes_dir/note$note_number.txt" ]; then
        # Encrypt the note file with the provided password and overwrite the original file
        openssl enc -aes-256-cbc -salt -in "$notes_dir/note$note_number.txt" -out "$notes_dir/note$note_number.txt.enc" -k "$password" -pbkdf2
        rm "$notes_dir/note$note_number.txt"  # Remove the original unencrypted file
        mv "$notes_dir/note$note_number.txt.enc" "$notes_dir/note$note_number.txt"  # Rename the encrypted file to the original file name
        echo "Note $note_number password protected."
    else
        echo "Note $note_number does not exist."
    fi
elif [ "$1" == "decrypt" ]; then
    note_number=$2
    password=$3

    if [ -f "$notes_dir/note$note_number.txt" ]; then
        # Decrypt the encrypted note file with the provided password and output to a temporary file
        if openssl enc -d -aes-256-cbc -in "$notes_dir/note$note_number.txt" -out "$notes_dir/note$note_number.txt.tmp" -k "$password" -pbkdf2 2>/dev/null; then
            mv "$notes_dir/note$note_number.txt.tmp" "$notes_dir/note$note_number.txt"  # Replace the original encrypted file with the decrypted content
            echo "Note $note_number decrypted."
        else
            echo "Error decrypting note $note_number. Incorrect password or decryption failed."
            rm "$notes_dir/note$note_number.txt.tmp"  # Remove the temporary file
        fi
    else
        echo "Encrypted note $note_number does not exist."
    fi
elif [ "$1" == "help" ] || [ -z "$1" ]; then
    echo "Available commands:"
    echo "./note.sh edit <note_number> <note_text> - Edit a note"
    echo "./note.sh delete <note_number> - Delete a note"
    echo "./note.sh read <note_number> <password> - Read a password-protected note"
    echo "./note.sh insert <note_number> <new_note> - Insert a new note with a specific number"
    echo "./note.sh copy <note_number> - Copy the content of a note to clipboard"
    echo "./note.sh deleteall - Delete all notes in the folder"
    echo "./note.sh ls - List the total amount of notes/files"
    echo "./note.sh open - Open the Notes folder"
    echo "./note.sh pw <note_number> <password> - Encrypt and password protect a note file"
    echo "./note.sh decrypt <note_number> <password> - Decrypt a password-protected note file"
    echo "./note.sh help - Display available commands"
    echo "./note.sh <new_note> - Add a new note"
else
    note_text="${@}"
    note_number=1
    while [ -f "$notes_dir/note$note_number.txt" ]; do
        note_number=$((note_number + 1))
    done
    echo "$note_text" > "$notes_dir/note$note_number.txt"
    echo "Note $note_number saved."
fi
