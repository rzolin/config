cd /Volumes/Backup/Backups.backupdb/Roman’s\ MacBook\ Pro/Latest/Macintosh\ HD/

sudo sync -a ./System/Library/QuickLook/ ~/System/Library/QuickLook/

cd /Volumes/Backup/Backups.backupdb/Roman’s\ MacBook\ Pro/Latest/Macintosh\ HD/Users/rzolin/

rsync -rtvPa Library/Keychains/ ~/Library/Keychains/

rsync -rtvPa Library/Application\ Support/Alfred\ 2 ~/Library/Application\ Support/
rsync -rtvPa Library/Application\ Support/BetterTouchTool ~/Library/Application\ Support/
rsync -rtvPa Library/Application\ Support/Charles ~/Library/Application\ Support/
rsync -rtvPa Library/Application\ Support/AndroidStudio ~/Library/Application\ Support/
rsync -rtvPa Library/Application\ Support/IntelliJIdea* ~/Library/Application\ Support/
rsync -rtvPa Library/Application\ Support/Navicat\ Premium ~/Library/Application\ Support/
rsync -rtvPa Library/Application\ Support/Path\ Finder ~/Library/Application\ Support/
rsync -rtvPa Library/Application\ Support/Shimo ~/Library/Application\ Support/
rsync -rtvPa Library/Application\ Support/SourceTree ~/Library/Application\ Support/
rsync -rtvPa Library/Application\ Support/Spotify ~/Library/Application\ Support/
rsync -rtvPa Library/Application\ Support/Skype ~/Library/Application\ Support/
rsync -rtvPa Library/Application\ Support/appCode* ~/Library/Application\ Support/
rsync -rtvPa Library/Application\ Support/iTerm ~/Library/Application\ Support/

rsync -rtvPa Library/Preferences/*.BetterTouch* ~/Library/Preferences/
rsync -rtvPa Library/Preferences/*Alfred* ~/Library/Preferences/
rsync -rtvPa Library/Preferences/*harles* ~/Library/Preferences/
rsync -rtvPa Library/Preferences/AndroidStudio ~/Library/Preferences/
rsync -rtvPa Library/Preferences/IntelliJIdea* ~/Library/Preferences/
rsync -rtvPa Library/Preferences/appCode* ~/Library/Preferences/
rsync -rtvPa Library/Preferences/*PathFinder* ~/Library/Preferences/
rsync -rtvPa Library/Preferences/*iterm* ~/Library/Preferences/
rsync -rtvPa Library/Preferences/*dobe* ~/Library/Preferences/
rsync -rtvPa Library/Preferences/*geny* ~/Library/Preferences/
rsync -rtvPa Library/Preferences/*google* ~/Library/Preferences/
rsync -rtvPa Library/Preferences/*jetbrains* ~/Library/Preferences/
rsync -rtvPa Library/Preferences/*appsolute* ~/Library/Preferences/
rsync -rtvPa Library/Preferences/*jetbrains* ~/Library/Preferences/
rsync -rtvPa Library/Preferences/*jetbrains* ~/Library/Preferences/

sync -a ./Projects ~/
sync -a ./UTIL ~/
sync -a ./tmp2 ~/
sync -a ./Documents/ ~/Documents/
sync -a ./Pictures/ ~/Pictures/

sync -a ./.appCode31 ~/
sync -a ./.httpie ~/
sync -a ./.IntelliJIdea14 ~/

sync -a ./.bash_history ~/
sync -a ./.bash_profile ~/
sync -a ./.bash_ps1 ~/
sync -a ./.bashrc ~/
sync -a ./.fasd ~/
sync -a ./.fasd-init-cache ~/
sync -a ./.git-credentials ~/
sync -a ./.gitconfig ~/
sync -a ./.gitignore ~/
sync -a ./.ideavimrc ~/
sync -a ./.sqliterc ~/
sync -a ./.viminfo ~/
sync -a ./.vimrc ~/

