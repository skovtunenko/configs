#   -----------------------------------------------------------------------------------------------------------------------------------------------------------
#  Last update date: 01.Dec.2018
#   -----------------------------------------------------------------------------------------------------------------------------------------------------------

txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
badgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset

#   -----------------------------------------------------------------------------------------------------------------------------------------------------------
#   ENVIRONMENT CONFIGURATION
#   -----------------------------------------------------------------------------------------------------------------------------------------------------------

#   Change Prompt
parse_git_branch () {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
print_before_the_prompt () {
    printf "\n⚜  $bldgrn%s\n$txtrst" "$PWD $(parse_git_branch)"
}
export PROMPT_COMMAND=print_before_the_prompt
export PS1="\[\033[1;34m\]\!\[\033[0m\] \[\033[1;35m\]\u\[\033[0m\]:\[\033[1;35m\]\W\[\033[0m\]$ "
export PS2="| => "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export EDITOR="code"

alias c='clear'
alias l='ls -a'
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
cd() { builtin cd "$@"; l; }                # Always list directory contents upon 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias edit='$EDITOR'                        # edit:         Opens any file in TextMate editor
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
ql () { qlmanage -p "$*" >& /dev/null; }    # ql:           Opens any file in MacOS Quicklook Preview

alias ghx='cd $HOME/Documents/Dev/Java/GitCheckouts/GHX'
alias grs='cd $HOME/Documents/Dev/Java/GitCheckouts/GRS'
alias godir='cd $GOPATH'
alias goprojects='cd $HOME/Documents/Dev/GoProjects'
alias dev='cd $HOME/Documents/Dev'
alias ghx_apply_mongo_scripts='cd $HOME/Documents/Dev/Java/GitCheckouts/GHX/all/scripts && bash mongo-ALL-LOCAL.sh && ghx'
alias ghx_apply_configsvc_scripts='cd $HOME/Documents/Dev/Java/GitCheckouts/GHX/all/scripts && bash mongo-CONFIGSVC-LOCAL.sh && ghx'
alias ramdrive_tomcat='cp -r $CATALINA_HOME /Volumes/ramdisk/tomcat && mkdir /Volumes/ramdisk/GRU && mkdir /Volumes/ramdisk/tmp && mkdir /Volumes/ramdisk/logs && echo Tomcat was copied to ramdisk'
alias dumpTpmDbToCurrentDir='mysqldump --user=root --password=root --databases tpm --routines > ./tpmDump.sql'

# External SSD developement aliases:
alias ssdGradleEnv='export GRADLE_USER_HOME=/Volumes/DEV/.gradle && echo "Gradle will point to external SSD drive"'
alias ssdMavenEnv='export M2_REPO=/Volumes/DEV/.m2/repository && echo "Maven will point to external SSD drive"'
alias ssdGoEnv='export GOCACHE=/Volumes/DEV/Golang/go-build && export GOTMPDIR=/Volumes/DEV/Golang/tmp-dir && echo Golang will point to external SSD drive'
alias normalEnv='export M2_REPO=~/.m2/repository && echo "Maven will point to regular drive"'
alias ssdAbc='cd /Volumes/DEV/GitCheckouts/abcfinancial2'
alias ssdCheck='env | pt M2 && env | pt GRADLE && env | pt GO'
alias ssdDev='ssdMavenEnv && ssdGradleEnv && ssdGoEnv && ssdCheck && ssdAbc'

# RAMDRIVE section: https://bogner.sh/2012/12/os-x-create-a-ram-disk-the-easy-way/
# 3Gib ramdisk for maven builds
function ramdrive_3gb() {
  if [ -d /Volumes/ramdisk ]; then
    echo "Ramdisk already exist."
  else
    diskutil erasevolume HFS+ 'ramdisk' `hdiutil attach -nomount ram://6291456`
    echo "3 GB ramdrive has been mounted"
  fi
}

# 4Gib ramdisk for maven builds
function ramdrive_4gb() {
  if [ -d /Volumes/ramdisk ]; then
    echo "Ramdisk already exist."
  else
    diskutil erasevolume HFS+ 'ramdisk' `hdiutil attach -nomount ram://8388608`
    echo "4 GB ramdrive has been mounted"
  fi
}

# 5Gib ramdisk for maven builds
function ramdrive_5gb() {
  if [ -d /Volumes/ramdisk ]; then
    echo "Ramdisk already exist."
  else
    diskutil erasevolume HFS+ 'ramdisk' `hdiutil attach -nomount ram://10485760`
    echo "5 GB ramdrive has been mounted"
  fi
}

# 6Gib ramdisk for maven builds
function ramdrive_6gb() {
  if [ -d /Volumes/ramdisk ]; then
    echo "Ramdisk already exist."
  else
    diskutil erasevolume HFS+ 'ramdisk' `hdiutil attach -nomount ram://12582912`
    echo "6 GB ramdrive has been mounted"
  fi
}

# 7Gib ramdisk for maven builds
function ramdrive_7gb() {
  if [ -d /Volumes/ramdisk ]; then
    echo "Ramdisk already exist."
  else
    diskutil erasevolume HFS+ 'ramdisk' `hdiutil attach -nomount ram://14680064`
    echo "7 GB ramdrive has been mounted"
  fi
}

# 8Gib ramdisk for maven builds
function ramdrive_8gb() {
  if [ -d /Volumes/ramdisk ]; then
    echo "Ramdisk already exist."
  else
    diskutil erasevolume HFS+ 'ramdisk' `hdiutil attach -nomount ram://16777216`
    echo "8 GB ramdrive has been mounted"
  fi
}

# 9Gib ramdisk for maven builds
function ramdrive_9gb() {
  if [ -d /Volumes/ramdisk ]; then
    echo "Ramdisk already exist."
  else
    diskutil erasevolume HFS+ 'ramdisk' `hdiutil attach -nomount ram://18874368`
    echo "9 GB ramdrive has been mounted"
  fi
}

alias light_devsetup='ramdrive_3gb && ramdrive_tomcat && echo "⚜    3 GB ramdrive has been mounted with tomcat"'
alias devsetup='ramdrive_8gb && ramdrive_tomcat && echo "⚜    8 GB ramdrive has been mounted with tomcat"'

# After installing Homebrew package "bash-completion" i added the following lines here (as suggested):
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
# Ensure Homebrew user-installed binaries take precedence:
export PATH=/usr/local/bin:$PATH

#   -----------------------------------------------------------------------------------------------------------------------------------------------------------
#   JVM DEVELOPEMENT CONFIG
#   -----------------------------------------------------------------------------------------------------------------------------------------------------------

# More details on this script here:
# http://www.jayway.com/2014/01/15/how-to-switch-jdk-version-on-mac-os-x-maverick/
function setjdk() {
  if [ $# -ne 0 ]; then
   removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
   if [ -n "${JAVA_HOME+x}" ]; then
    removeFromPath $JAVA_HOME
   fi
   export JAVA_HOME=`/usr/libexec/java_home -v $@`
   export PATH=$JAVA_HOME/bin:$PATH
  fi
 }
 function removeFromPath() {
  export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")
 }
setjdk 1.8

# Tomcat
export CATALINA_HOME=/usr/local/opt/tomcat/libexec

# Ant
export ANT_HOME=/usr/local/opt/ant/libexec

# Maven
export M2_HOME=/usr/local/opt/maven/libexec
export M2_REPO=~/.m2/repository
export MAVEN_OPTS="-Xms512m -Xmx3072m -XX:+TieredCompilation -XX:TieredStopAtLevel=1"

# Gradle
export PATH=$PATH:~/Documents/Dev/gradle47/bin
export GRADLE_OPTS="-Xms512m -Xmx2048m"

# Scala
export SCALA_HOME=/usr/local/opt/scala/libexec

# Kotlin
export KOTLIN_HOME=/usr/local/opt/kotlin/libexec

# JMeter installation:
# export JMETER_HOME=$HOME/Documents/Dev/Java/jmeter_2_13

# Amazon IAM Credentials
#export AWS_ACCESS_KEY_ID=AKIA****
#export AWS_SECRET_ACCESS_KEY=ooGHB****
#export AWS_DEFAULT_REGION=us-west-2

# Amazon Bash suggestions for AWS CLI tool (from Homebrew):
complete -C aws_completer aws

#   -----------------------------------------------------------------------------------------------------------------------------------------------------------
#   GO DEVELOPEMENT CONFIG
#   -----------------------------------------------------------------------------------------------------------------------------------------------------------

export GOPATH=$HOME/Documents/Dev/Go
export PATH=/usr/local/opt/go/libexec/bin:$GOPATH/bin:$PATH
# export GO111MODULE=on

alias gocover='go tool cover -html cover.out -o coverage.html'
alias godocserver='godoc -http=:6060 & open http://127.0.0.1:6060/pkg'
# goconvey is a testing tool: go get -u github.com/smartystreets/goconvey
alias goconvey='goconvey -launchBrowser=false -port=6061'
# colorgo is a wrapper to go command that colorizes output from go build and go test. go get -u github.com/songgao/colorgo
alias go=colorgo
# depth is tool to retrieve and visualize Go source code dependency trees. go get -u github.com/KyleBanks/depth/cmd/depth
alias godepth=depth
# go-callvis is a development tool to help visualize call graph of your Go program using Graphviz's dot format. go get -u github.com/TrueFurby/go-callvis
function gocallvis() {
  go-callvis -nostd -group pkg,type -focus $1 $2 | dot -Tpng -o gocallvis.png
  retval=$? # The return value is stored in $?. 0 indicates success, others indicates error.
  if [ $retval -eq 0 ]; then
    open ./gocallvis.png
  else
    echo "Unable to run go-callvis for $1 and main package: $2 to output call graph $retval"
  fi
}
# A Go dependency graph visualization tool. go get -u github.com/kisielk/godepgraph
function gograph() {
  godepgraph -s $1 | dot -Tpng -o godepgraph.png
  retval=$? # The return value is stored in $?. 0 indicates success, others indicates error.
  if [ $retval -eq 0 ]; then
    open ./godepgraph.png
  else
    echo "Unable to run godepgraph -s $1 command to output graph: $retval"
  fi
}

#                   Fix for permission denied in iTerm -> change permission for directory:
#sudo chown -R skovtunenko ~/Documents/Dev/Go/legacy
#                   Experimental Golang info:
# Tip for set the current directory to GOPATH in one command: 
#alias gopath='export GOPATH=$(pwd | awk -F"src" "{print \$1}"); echo "set GOPATH to $GOPATH"'

#   -----------------------------------------------------------------------------------------------------------------------------------------------------------
#   OTHER DEVELOPEMENT CONFIG
#   -----------------------------------------------------------------------------------------------------------------------------------------------------------

# Mongo and MySql services:
#alias venv='source $HOME/awsssh/venv-tunnel/bin/activate'
alias stopall='brew services stop --all'
alias startall='brew services start --all'
#alias mysqlstop='brew services stop mysql@5.6'
#alias mysqlstart='brew services start mysql@5.6'
#alias mysqlrestart='brew services restart mysql@5.6'
#alias mongostart='brew services start mongodb'
#alias mongostop='brew services stop mongodb'
#alias mongorestart='brew services restart mongodb'

alias ftpservicestop='sudo -s launchctl unload -w /System/Library/LaunchDaemons/ftp.plist'
alias ftpservicestart='sudo -s launchctl load -w /System/Library/LaunchDaemons/ftp.plist'

# alias elasticsearchstart='$HOME/Documents/Dev/elasticsearch-2.4.4/bin/elasticsearch'
alias elasticsearchstart='$HOME/Documents/Dev/elasticsearch-5.6.8/bin/elasticsearch'
alias cerebro='$HOME/Documents/Dev/cerebro/bin/cerebro'

# yED java editor:
alias yed='java -jar $HOME/Documents/Dev/yed/yed.jar -server -Xms512m -Xmx4096m -XX:MaxMetaspaceSize=512m -XX:ReservedCodeCacheSize=256m -XX:CompileThreshold=1000 -XX:+UseFastJNIAccessors -XX:+UseFastEmptyMethods -XX:+UseFastAccessorMethods -Xverify:none -XX:+UseStringCache -XX:+OptimizeStringConcat -XX:+UseCompressedOops'

#   -----------------------------------------------------------------------------------------------------------------------------------------------------------
#   GIT ENVIRONMENT CONFIG
#   -----------------------------------------------------------------------------------------------------------------------------------------------------------

export GIT_PS1_SHOWDIRTYSTATE=1
alias gst='git status'
alias gco='git checkout'
alias gci='git commit'
alias grb='git rebase'
alias gbr='git branch'
alias gad='git add -A'
alias gpl='git pull'
alias gpu='git push'
alias gfe='git fetch'
alias glg='git log --date-order --all --graph --format="%C(green)%h%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset%s"'
alias glg2='git log --date-order --all --graph --name-status --format="%C(green)%H%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset%s"'
git_remove_remote_branch() {
    git push origin --delete $1
}
alias gitrm=git_remove_remote_branch
# Show all alias related git:
galias() { alias | grep 'git' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }

#   -----------------------------------------------------------------------------------------------------------------------------------------------------------
#   DOCKER (Read more: https://dev.to/argherna/bash-functions-and-aliases-for-the-beginning-docker-developer-d4)
#   -----------------------------------------------------------------------------------------------------------------------------------------------------------

# Aliases from https://gist.github.com/skovtunenko/af9a64cce917c6460532d0fe45e0038d
# Get process included stop container
alias dpa="docker ps -as"
# Get images:
alias di="docker images"
# Get container IP:
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
# Stop all containers:
dstop() { docker stop $(docker ps -a -q); }
# Show all alias related docker:
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }

#   -----------------------------------------------------------------------------------------------------------------------------------------------------------
#   MISC.
#   -----------------------------------------------------------------------------------------------------------------------------------------------------------

# iTerm2 integration:
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
