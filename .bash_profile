
export PATH="/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/libexec/java_home:$PATH"
export DEVELOPER_DIR="/Applications/XCode.app/Contents/Developer"
export LANG=ru_RU.UTF-8
export JAVA_HOME=$(/usr/libexec/java_home)
export RBENV_ROOT=/usr/local/var/rbenv
export PGDATA="/usr/local/var/postgres"


#set meta-flag on
#set input-meta on
#set output-meta on
#set convert-meta off

tabr() { osascript <<SCRIPT
tell application "iTerm"
	tell the first terminal
		launch session "Default Session"
		tell the last session
			write text "cd /Users/rzolin/Projects/Ruby"
		end tell
	end tell
end tell
SCRIPT
}

export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad


# Home IP - 66.44.49.187

alias sshHome='ssh rzolin@rzolinmini.zapto.org'
alias ssfHome='sshfs / rzolin@rzolinmini.zapto.org'
alias mountMini='sshfs rzolin@rzolinmini.zapto.org: ~/temp'
alias sshMob='ssh rzolin@74.9.152.221'
alias sshEbt='ssh roman@209.190.246.82'
alias sshSquash='ssh roma@192.168.32.141'
alias ls='ls -GFha'
alias sync='rsync -rtvupP'
alias cleanSVN='find . -name .svn -print0 | xargs -0 rm -rf'
alias symbolicate="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/
PrivateFrameworks/DTDeviceKit.framework/Versions/A/Resources/symbolicatecrash -v"
alias xctool='~/UTIL/xctool/xctool.sh'
alias cdMyTwoCents='cd ~/Projects/My02c/my02c/Frontend/IPhone/MyTwoCents/'
alias cdMyIos='cd /Users/rzolin/Projects/My02c/Outsoruced/my02c-ios'
alias cdMyAnd='cd /Users/rzolin/AndroidStudioProjects/My02Cents'
alias cdAppian='cd ~/Projects/Appian/ios/'
alias jenkins="java -jar /usr/local/Cellar/jenkins/jenkins-cli.jar -s http://localhost:9090/"
alias vimNginx="sudo vim /usr/local/etc/nginx/nginx.conf"
alias nginxRestart="sudo nginx -s stop; sudo nginx;"
alias jenkinsUnload="launchctl unload /Library/LaunchDaemons/org.jenkins-ci.plist"
alias jenkinsLoad="launchctl load /Library/LaunchDaemons/org.jenkins-ci.plist"
alias jenkinsReload="jenkinsUnload; jenkinsLoad;"
alias gitUnload="launchctl unload /Library/LaunchAgents/homebrew.mxcl.gitbucket.plist"
alias gitLoad="launchctl load /Library/LaunchAgents/homebrew.mxcl.gitbucket.plist"
alias gitReload="gitUnload; gitLoad;"
alias cdPockitshipNode="cd /var/www/pockitship/app"
alias runPockitshipNode="cd /var/www/pockitship/app && nodemon ./bin/www"
alias restartPockitshipNode="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.nodejs.pockitship.plist && launchctl load ~/Library/LaunchAgents/homebrew.mxcl.nodejs.pockitship.plist"

if [ -f "$HOME/.bash_ps1" ]; then
. "$HOME/.bash_ps1"
fi

