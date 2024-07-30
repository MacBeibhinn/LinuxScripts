#!/bin/bash

# Run the script in the terminal; ./install_discord.sh
# The script will essentially download/update the Discord application
# Discord download link (change if needed; https://discord.com/download)
DISCORD_URL="https://discord.com/api/download?platform=linux&format=deb"
# Output file path, change if needed
OUTPUT_FILE="$HOME/Downloads/discord.deb"
# (Re)Install Discord
install_discord() {
    echo "Installing Discord..."
    sudo dpkg -i "$OUTPUT_FILE"
    sudo apt-get install -f  # Fix any dependency issues
}
# Check if Discord is already installed
if dpkg -l | grep -q discord; then
    echo "Discord is already installed."
else
    echo "Discord is not installed."
fi
# Prompt for confirmation to download the file
read -p "Do you want to download the Discord package? (y/n): " download_confirm
if [[ "$download_confirm" == "y" || "$download_confirm" == "Y" ]]; then
    # Download the Discord package/file
    echo "Downloading Discord..."
    wget -O "$OUTPUT_FILE" "$DISCORD_URL"
    # Prompt for confirmation to (re)install
    read -p "Do you want to (re)install Discord? (y/n): " install_confirm
    if [[ "$install_confirm" == "y" || "$install_confirm" == "Y" ]]; then
        # (re)install Discord
        install_discord
        # Delete the downloaded file (no longer needed)
        rm "$OUTPUT_FILE"
        echo "Discord has been (re)installed successfully, and the downloaded file has been deleted."
        # Prompt to start Discord
        read -p "Do you want to start Discord now? (y/n): " start_confirm
        if [[ "$start_confirm" == "y" || "$start_confirm" == "Y" ]]; then
            nohup discord > /dev/null 2>&1 &  # Start Discord in the background and suppress output
            echo "Discord is starting, you may now close the terminal."
        else
            echo "You can start Discord later from your applications menu."
        fi
    else
        echo "(Re)Installation cancelled."
        # Delete the downloaded file if the user cancels (re)installation
        rm "$OUTPUT_FILE"
    fi
else
    echo "Download cancelled."
fi
