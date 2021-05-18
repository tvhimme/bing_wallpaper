# Daily wallpaper

If you run `wallpaper.sh`, You fetch a wallpaper from an api and set it as your background.  
You can plan this script to run daily using cronjobs.

### Where are the wallpapers from?
https://peapix.com/bing/US  
This is an api which returns the daily Bing wallpaper (as used on Windows 10).

### How do I use cronjobs?
1. start the terminal
2. enter `crontab -e`
3. add the content of `crontab.txt` to the bottom of the file
Cronjobs only run when your pc is running.  

This script is made for *Ubuntu 20.10* (*Pop!_OS 20.10* to be more precise), and may not run on other operating systems.
