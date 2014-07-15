# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export PATH="/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/libexec/java_home:$PATH"
export DEVELOPER_DIR="/Applications/XCode.app/Contents/Developer"
export LANG=ru_RU.UTF-8
export JAVA_HOME=$(/usr/libexec/java_home)
export RBENV_ROOT=/usr/local/var/rbenv
export PGDATA="/usr/local/var/postgres"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export DOCKER_HOST=tcp://localhost:2375
export DOCKER_MEMORY=2048
export DOCKER_CPUS=2


# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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
alias symbolicate="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/
PrivateFrameworks/DTDeviceKit.framework/Versions/A/Resources/symbolicatecrash -v"
alias xctool='~/UTIL/xctool/xctool.sh'
alias cdMyTwoCents='cd ~/Projects/My02c/my02c/Frontend/IPhone/MyTwoCents/'
alias cdMySasha='cd /Users/rzolin/Projects/My02c/sasha'
alias cdMyAnd='cd /Users/rzolin/AndroidStudioProjects/My02Cents'
alias vimNginx="sudo vim /usr/local/etc/nginx/nginx.conf"
alias nginxRestart="sudo nginx -s stop; sudo nginx;"
alias startPonyDebugger="ponyd serve --listen-interface=127.0.0.1"
alias startATServer='cd ~/Projects/ArmorText/Server/armortext-server-sandbox-spring-boot/; vagrant up; vagrant ssh'
alias cdLT='cd /Users/rzolin/Projects/Web/LittleTouches'
alias runAT='cd ~/Projects/ArmorText/Server; mvn clean package -DskipTests spring-boot:run -pl armortext-server-sandbox-spring-boot'
alias cdATiPhone='cd ~/Projects/ArmorText/IOS/iPhone'


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

# Uncomment the following line to disable command auto-correction.
DISABLE_CORRECTION="true"

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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-flow docker mvn npm pod sublimes)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"


# Prompt line
# build b/w prompt for git and vertial env
[[ ! -z $GIT_BRANCH ]] &&PS1_GIT=" (git: ${GIT_BRANCH})"
[[ ! -z $VIRTUAL_ENV ]] &&PS1_VENV=" (venv: ${VIRTUAL_ENV#$WORKON_HOME})"
# calculate fillsize
local fillsize=$COLUMNS
local FILL=$color_gray
while [ $fillsize -gt 0 ]; do FILL="${FILL}."; fillsize=$(($fillsize-1)); done
FILL="${FILL}${color_off}"
# set new color prompt
PS1="${FILL}$PS1"

