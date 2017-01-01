# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# AutoJump enabling
[[ -s `brew --prefix`/etc/autojump.sh  ]] && . `brew --prefix`/etc/autojump.sh

#{{{ Settings

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

#}}}


#{{{ ZSH Settings

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(brew git git-flow git-extras gradle docker mvn node npm pod sublimes vagrant composer syfony2 osx pod bower fasd common-aliases)

source $ZSH/oh-my-zsh.sh

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

#}}}


#{{{ Aliases

function da () {
    docker exec -it $1 bash
}

function brewUpgrade () {
   brew doctor
   brew update
   brew upgrade
   for c in `brew cask list`; do ! brew cask info $c | grep -qF 'Not installed' || brew cask install $c; done
   brew cleanup
   brew cask cleanup
}

alias drm="docker rm"
alias drmi="docker rmi"
alias dps="docker ps"
alias dpsa="docker ps -a"
alias di="docker images"

alias bu=brewUpgrade

alias gfs='git flow feature start'
alias gff='git flow feature finish'
alias gfp='git flow feature publish'
alias gcb='gradle clean build'
alias sshHome='ssh rzolin@rzolin.net'
alias ssfHome='sshfs / rzolin@rzolinmini.zapto.org'
alias mountMini='sshfs rzolin@rzolinmini.zapto.org: ~/temp'
alias sshMob='ssh rzolin@74.9.152.221'
alias sshEbt='ssh roman@209.190.246.82'
alias sshSquash='ssh roma@192.168.32.141'
alias ls='ls -GFha'
alias b2='boot2docker'
alias sync='rsync -rtvupP'
alias cleanSVN='find . -name .svn -print0 | xargs -0 rm -rf'
alias xctool='~/UTIL/xctool/xctool.sh'
alias cdMyTwoCents='cd ~/Projects/My02c/my02c-ios'
alias cdMySasha='cd /Users/rzolin/Projects/My02c/sasha'
alias cdMyAnd='cd /Users/rzolin/AndroidStudioProjects/My02Cents'
alias vimNginx="sudo vim /usr/local/etc/nginx/nginx.conf"
alias nginxRestart="sudo nginx -s stop; sudo nginx;"
alias startPonyDebugger="ponyd serve --listen-interface=127.0.0.1"
alias startATServer='cd ~/Projects/ArmorText/Server/armortext-server-sandbox-spring-boot/; vagrant up; vagrant ssh'
alias cdLT='cd /Users/rzolin/Projects/Web/LittleTouches'
alias runAT='cd ~/Projects/ArmorText/Server;  mvn clean install -DskipTests && mvn spring-boot:run -pl armortext-server-base-app'
alias cdATMessenger='cd ~/Projects/ArmorText/IOS/Messenger'
alias cdATSDK='cd ~/Projects/ArmorText/IOS/SDK'
alias cdATAndroid='cd ~/Projects/ArmorText/Android'
alias cdATAudit='cd ~/Projects/ArmorText/Audit'
alias runPonyD='ponyd serve -i 0.0.0.0'
alias cdLT='cd ~/Projects/Web/LT'
alias cdLTpackage='cd ~/Projects/Web/LT/packages/custom/lt'
alias watchLT='cdLT; cd packages/custom/lt; compass watch'
alias idiff='/Applications/IntelliJ\ IDEA\ 14.app/Contents/MacOS/idea diff $'
alias runLTDocker='docker run -t -i -p 80:3000 lt /bin/bash'
alias buildLTDocker='docker build -t lt ~/Projects/Web/LT_Docker/'
alias dm='docker-machine'
alias dps='docker ps -a'
alias dim='docker images -a'
alias drmc='docker rm -f'
alias drmi='docker rmi -f'
alias drun='docker run -itPp 3000:3000'
alias vca='vcsh config add'
alias vcc='vcsh config commit'
alias F="fold -w 80 -s"
#}}}


#{{{ Maven Colors

# thanks to:  http://blog.blindgaenger.net/colorize_maven_output.html
# and: http://johannes.jakeapp.com/blog/category/fun-with-linux/200901/maven-colorized
# Colorize Maven Output
alias maven="command mvn"
function color_maven() {
local BLUE="[0;34m"
local RED="[0;31m"
local LIGHT_RED="[1;31m"
local LIGHT_GRAY="[0;37m"
local LIGHT_GREEN="[1;32m"
local LIGHT_BLUE="[1;34m"
local LIGHT_CYAN="[1;36m"
local YELLOW="[1;33m"
local WHITE="[1;37m"
local NO_COLOUR="[0m"
maven "$@" | sed \
   -e "s/----/${LIGHT_CYAN}----/g" \
   -e "s/[Ww]arning:/${LIGHT_GREEN}warning:$NO_COLOUR/g" \
   -e "s/Tests run: \([^,]*\), Failures: \([^,]*\), Errors: \([^,]*\), Skipped: \([^,]*\)/${LIGHT_GREEN}Tests run: \1$NO_COLOUR, Failures: $RED\2$NO_COLOUR, Errors: $YELLOW\3$NO_COLOUR, Skipped: $LIGHT_BLUE\4$NO_COLOUR/g" \
   -e "s/\(\[\{0,1\}WARN\(ING\)\{0,1\}\]\{0,1\}.*\)/$YELLOW\1$NO_COLOUR/g" \
   -e "s/\(\[ERROR\].*\)/$RED\1$NO_COLOUR/g" \
   -e "s/\(\(BUILD \)\{0,1\}FAILURE.*\)/$RED\1$NO_COLOUR/g" \
   -e "s/\(\(BUILD \)\{0,1\}SUCCESS.*\)/$LIGHT_GREEN\1$NO_COLOUR/g" \
   -e "s/\(\[INFO\].*\)/$LIGHT_GRAY\1$NO_COLOUR/g"
return $PIPESTATUS
}

alias mvn=color_maven
alias maven=/usr/local/bin/mvn

#}}}


#{{{ Android Commands and Aliases

get_adb_db() {
   adb shell "run-as co.armortext.android.$1 chmod 666 databases/armortext_messenger.db"
   adb pull /data/data/co.armortext.android.$1/databases/armortext_messenger.db armortext_$1.db

}

alias adb_db=get_adb_db

#}}}


#{{{ Prompt line

# build b/w prompt for git and vertial env
[[ ! -z $GIT_BRANCH ]] &&PS1_GIT=" (git: ${GIT_BRANCH})"
[[ ! -z $VIRTUAL_ENV ]] &&PS1_VENV=" (venv: ${VIRTUAL_ENV#$WORKON_HOME})"
# calculate fillsize
local fillsize=$COLUMNS
local FILL=$color_gray
while [ $fillsize -gt 0 ]; do FILL="${FILL}."; fillsize=$(($fillsize-1)); done
FILL="${FILL}${color_off}"
# set new color prompt
NEWLINE=$'\n'
PS1="${FILL}${NEWLINE}$PS1"

#}}}

# Docker init
$(b2 shellinit)

[ -s "/Users/rzolin/.scm_breeze/scm_breeze.sh" ] && source "/Users/rzolin/.scm_breeze/scm_breeze.sh"
