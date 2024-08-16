# Alternative Discord

Replaces the Discord client with the web app, while still showing on the system menus and panel etc. Since we use the official Discord web app it loads faster than the client, does not require updates, can be used with browser extensions, and more.

Using the Stylus extension in the browser, we can modify how Discord looks without risking any sort of account ban, since we are not modifying the Discord client, we are just modifying our browser.

# Installation

- Download the `discord.sh` file to your home directory (`/home/username`) and grant execution permissions, or run permissions.
- Download the `discord.desktop` file to your applications folder `/home/username/.local/share/applications`.
- Download the `discord_icon.png` file to your Pictures folder `/home/username/Pictures`.
- Inside of the `discord.desktop` file you can make any changes you need to, such as the location of the icon (Icon) or script (Exec), whatever value you give Name will be what shows up in your applications menu:
```
[Desktop Entry]
Version=1.0
Name=Discord
Exec=/home/username/discord.sh
Icon=/home/username/Pictures/discord_icon.png
Terminal=false
Type=Application
Categories=Utility;
```
- Search within your applications menu for your new app, Discord (if you kept the name), from there you can add it to your panel or favourites (optional).
- To apply a theme to the Discord web app you can use Stylus (depending on your browser, this example is created using Chromium): https://chromewebstore.google.com/search/Stylus for Chromium based browsers, or https://addons.mozilla.org/en-US/firefox/search/?q=Stylus for Firefox
- If you like to have Discord start when your system starts, you can add `discord.sh` as a command for a startup application.
