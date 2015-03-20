# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="kphoen"
ZSH_THEME="robbyrussell"
#miloshadzic
#ZSH_THEME="random"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rake brew coffee web-search)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH=$PATH:/Users/Nicholas/mozilla/adt-bundle-mac-x86_64/sdk/platform-tools
export PATH=$PATH:/Users/Nicholas/code/crystal/crystal/bin

# Custom
. ~/.nvm/nvm.sh
export ANDROIDFS_DIR=~/mozilla/B2G/backup-unagi
export CCACHE_DIR=~/.ccache
export CCACHE_COMPRESS=""
export XPCSHELL="/Users/Nicholas/Downloads/xulrunner-sdk/bin/XUL.framework/Versions/Current"
alias lip="ipconfig getifaddr en0"
alias eip="curl ifconfig.me"
alias serve="python -m SimpleHTTPServer"
alias e="nocorrect subl"
alias upstream="git remote add --track master upstream "
alias r2="cfx run --templatedir template/ --profiledir ~/mozilla/profiles/r2d2b2g/"
alias sshn="ssh n" # See ~/.ssh/config
alias fxos_log='adb logcat GeckoConsole:W *:F | python ~/mozilla/logcat/coloredlogcat.py'
alias tree='nocorrect tree'
alias pip='nocorrect pip'
alias hg='nocorrect hg'
alias gs='git status -sb'
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias port="lsof -i " # needs a :<port num>
alias mou="/Applications/Mou.app/Contents/MacOS/Mou"
alias mkd="/opt/homebrew-cask/Caskroom/macdown/0.2.5.1/MacDown.app/Contents/MacOS/MacDown"
alias src="source ~/.zshrc"
alias fly="butterfly.server.py --unsecure --port=3000"
alias clean="git branch --merged master | grep -v master | xargs git branch -d"

#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
