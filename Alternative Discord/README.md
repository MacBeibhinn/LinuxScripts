# Alternative Discord

Replaces the Discord client with the web app, while still showing on the system menus and panel etc. Since we use the official Discord web app it loads faster than the client, does not require updates, can be used with our browser extensions, and more.

Using the Stylus extension in the browser, we can modify how Discord looks without risking any sort of account ban, since we are not modifying the Discord client, we are modifying our browser.

# Installation

- Download the `discord.sh` file to your home directory and grant execution permissions, or run permissions.
- Open the Terminal and enter the following command: `nano ~/.local/share/applications/discord.desktop`, alternatively you can go to the following folder and create the file yourself: `/home/username/.local/share/applications/`
- Download a Discord icon (.png), it is better to choose a relatively small image size since it will only be used as an application icon, give the icon a simple name like "discord_icon.png", you can also download one from this repo if you don't care for searching for one yourself: https://github.com/MacBeibhinn/LinuxScripts/blob/main/Alternative%20Discord/discord_icon.png.
- Paste the following text inside of the `discord.desktop` file, make any changes you need to such as the location of the icon or script, whatever value you give Name will be what shows up in your menu/applications:

[Desktop Entry]

Version=1.0

Name=Discord

Exec=/home/username/discord.sh

Icon=/home/username/Pictures/discord_icon.png

Terminal=false

Type=Application

Categories=Utility;

- Search within your applications menu for your new app, Discord (if you kept the name), from there you can add it to your panel, launch it, or whatever you like.
- To apply a theme to the Discord web app you can use Stylus (depending on your browser, this example is based on Chromium): https://chromewebstore.google.com/search/Stylus
- If you like to have Discord start when your system starts, you can add `discord.sh` as a command for a startup application.
