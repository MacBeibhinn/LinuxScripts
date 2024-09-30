# Chrome - Clear Data on Startup

Created to automatically remove history, recent tabs, and cache on startup, then launch Chrome as normal, does not remove cookies, preferences, permissions, etc.

- Download the `clear_chrome_data.sh` script to your home folder and grant the file executable permissions.
- Download the `clear_chrome.desktop` file to your /home/username/.local/share/applications folder.
- Replace the "username" at the "Exec=/home/username/clear_chrome_data.sh" line inside of the `clear_chrome.desktop` file with your own username.
- Search and run Chrome Browser in your menu to start Chrome, it should now automatically remove your history, cache, and recent tabs everytime it launches.
