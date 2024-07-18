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
elif [ "$1" == "read" ] || [[ "$1" =~ ^[0-9]+$ ]]; then
    note_number=$1
    if [[ "$1" =~ ^[0-9]+$ ]]; then
        note_number=$1
    else
        note_number=$2
    fi

    if [ -f "$notes_dir/note$note_number.txt" ]; then
        cat "$notes_dir/note$note_number.txt"
    else
        echo "Note $note_number does not exist."
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
elif [ "$1" == "help" ] || [ -z "$1" ]; then
    echo "Available commands:"
    echo "./note.sh edit <note_number> <note_text> - Edit a note"
    echo "./note.sh delete <note_number> - Delete a note"
    echo "./note.sh read <note_number> - Read a note"
    echo "./note.sh insert <note_number> <new_note> - Insert a new note with a specific number"
    echo "./note.sh copy <note_number> - Copy the content of a note to clipboard"
    echo "./note.sh deleteall - Delete all notes in the folder"
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
