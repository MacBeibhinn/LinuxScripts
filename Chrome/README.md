# Chrome - Clear Data on Startup

This is an alternative to "Clear Data on Exit" options a lot of other browsers have, but Chrome lacks (as of the time this is uploaded), this is also an alternative to a lot of extensions that do something similar but from what I can see in most of their privacy policies is that they also collect/use your data, whether identifyable or not, so how can we trust extensions or Google to clear all of our data if they all aim to also use it? Well now we just do it ourselves, automatically, this script was created to remove history, recent tabs, and cache every time we launch the browser, it does not remove data that can disrupt our browsing if removed, data such as cookies, preferences, permissions, etc. To remove cookies every time Chrome starts you could add "rm -rf ~/.config/google-chrome/Default/Cookies" to the `clear_chrome_data.sh` file, to reset settings every time you could use "rm -rf ~/.config/google-chrome/Default/Preferences", and more which can be located in your "/home/username/.config/google-chrome/Default" folder.

# Installation

- Download the `clear_chrome_data.sh` script to your home folder and grant the file executable permissions.
- Download the `clear_chrome.desktop` file to your /home/username/.local/share/applications folder.
- Replace the "username" at the "Exec=/home/username/clear_chrome_data.sh" line inside of the `clear_chrome.desktop` file with your own username.
- Search and run Chrome Browser in your menu to start Chrome, it should now automatically remove your history, cache, and recent tabs everytime it launches.
