alias sync="rsync -rtvuP"

cd /Volumes/Backup/Backups.backupdb/Roman’s\ MacBook\ Pro/Latest/Macintosh\ HD/Users/rzolin/

sync -a ./.oh-my-zsh ~/
sync -a ./.ssh ~/
sync -a ./.vim ~/
sync -a ./.zsh_history ~/
sync -a ./.zsh-update ~/
sync -a ./.zshenv ~/
sync -a ./.zshrc ~/
sync -a ./.zshrc-e ~/

cd ~
gIt clone git@github.com:rzolin/config.git ~/config

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap homebrew/boneyard
brew bundle

# === Mongo DB Setup
sudo mkdir -p /data/db
sudo chmod -R 775 /data
ln -sfv /usr/local/opt/mongodb/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist

./sync.sh

expect -c '
set timeout -1;
spawn android - update sdk --no-ui -u -a;
expect {
    "Do you accept the license" { exp_send "y\r" ; exp_continue  }
        eof

}
'

sudo gem install compass

npm install mean -g
npm install bower -g

