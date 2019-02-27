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
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
#export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin
#export PATH=$PATH:/Users/Nicholas/mozilla/adt-bundle-mac-x86_64/sdk/platform-tools
#export PATH=$PATH:/Users/Nicholas/code/crystal/crystal/bin
#export PATH=$PATH:/Users/Nicholas/mozilla/moz-git-tools
#export PATH=$PATH:/Users/Nicholas/mozilla/git-cinnabar
#export PATH=$PATH:/Users/Nicholas/mozilla/emscripten

# Custom
. ~/.nvm/nvm.sh
export CCACHE_DIR=~/.ccache
export CCACHE_COMPRESS=""
alias serve="python -m SimpleHTTPServer"
alias upstream="git remote add --track master upstream "
alias tree='nocorrect tree'
alias hg='nocorrect hg'
alias gs='git status -sb'
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias port="lsof -i " # needs a :<port num>
alias src="source ~/.zshrc"
alias clean="git branch --merged master | grep -v master | xargs git branch -d"
if [ "$(uname -s)" = "Linux" ]; then
  alias lip="hostname -I | tr ' ' '\n'"
elif [ "$(uname -s)" = "Darwin" ]; then
  alias lip="ipconfig getifaddr en0"
fi
alias eip="curl ifconfig.me"
alias rake='noglob rake'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
export EDITOR=vim

#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
source $HOME/.rvm/scripts/rvm
export PATH="$PATH:$HOME/llvm/llvm/build/bin"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

function kpatch () {
  patch=$1
  shift
  git send-email \
      --cc-cmd="./scripts/get_maintainer.pl --norolestats $patch" \
        $@ $patch
}

# to remove old kernels:
# ls /boot
# locate -b -e 4.14.0+ | xargs -p sudo rm -r; sudo update-grub
