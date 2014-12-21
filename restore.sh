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
android update sdk -u -a

expect -c '
set timeout -1;
spawn android - update sdk --no-ui -u -a;
expect {
    "Do you accept the license" { exp_send "y\r" ; exp_continue }
    eof
}
'

mkdir -p /data/db
sudo chmod -R 775 /data

cd /Volumes/Backup/Backups.backupdb/Roman’s\ MacBook\ Pro/Latest/Macintosh\ HD/Users/rzolin/

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
