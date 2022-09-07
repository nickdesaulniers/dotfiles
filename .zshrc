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
#. ~/.nvm/nvm.sh
export CCACHE_DIR=~/.ccache
export CCACHE_COMPRESS=""
alias serve="python3 -m http.server 8000"
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

# New since Google
alias pyprof='python -m cProfile -s time '
alias deletebranches='git branch | grep -v "master" | xargs git branch -D'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias open="xdg-open &>/dev/null "
alias cim="vim"
export PATH="$PATH:/usr/local/google/home/ndesaulniers/.cargo/bin"
export EDITOR=vim

# Bug in terminator
# http://www.robmeerman.co.uk/unix/256colours
alias vim="TERM=xterm-256color vim"

# Google specific
export USE_CCACHE=1
export GOMA_DIR=${HOME}/goma
#export USE_GOMA=true
alias wipe="adb reboot bootloader && fastboot -w && fastboot continue"

# Clang
export LLVM_PATH=/android0/llvm-project
export CLANG_PATH=$LLVM_PATH/clang
export PATH=$PATH:$LLVM_PATH/llvm/build/bin
export PATH="$PATH:/android1/arcanist/arcanist/bin"
export PATH="$PATH:/android0/llvm-project/llvm/utils/git-svn"
alias cd_llvm="cd $LLVM_PATH"
alias cd_clang="cd $CLANG_PATH"
alias build_llvm="pushd $LLVM_PATH/llvm/build && ninja; popd"

function kpatch () {
  patch=$1
  shift
  git send-email \
      --cc-cmd="./scripts/get_maintainer.pl --norolestats $patch" \
        $@ $patch
}

function bisect () {
  hi=$1
  lo=$2
  echo $(( ($hi - $lo) / 2 + $lo ))
}

function dis () {
  file=$1
  func=$2
  gdb -batch -ex "file $1" -ex "disassemble $2"
}

function gdbr () {
  gdb -ex "target remote :1234" "$@"
}

function errno
{
  cpp -dM /usr/include/errno.h | grep " $@$"
  perl -E 'say $!=shift' "$@"
}

function rebase_llvm
{
  pushd $LLVM_PATH && git checkout master && git pull && \
    cd $CLANG_PATH && git checkout master && git pull && \
    cd $LLVM_PATH/lld && git pull && \
    popd
}

function test_llvm
{
  pushd $LLVM_PATH/llvm/build;
  ninja check-all;
  popd;
}

function first_tag () {
  tag=$1
  git describe --contains "$tag" | sed 's/~.*//'
}

function git_committers () {
  input_file=$1
  git log --pretty=format:'%an <%ae>' "$input_file" | sort| uniq
}

function apply () {
  git apply -v --check $1
  if [[ $? -eq 0 ]]; then
    git am $1
    echo "Applied ${1}"
  fi
}

function build_android () {
  if [[ -z "${TARGET_PRODUCT}" ]]; then
    echo "NEED TO SET LUNCH TARGET (\$TARGET_PRODUCT)"
    return
  fi
  USE_GOMA=1 make -j 46
}

# Prevent pubkey errors from github pushes after reboot
#[ -z "$SSH_AUTH_SOCK" ] && eval "$(ssh-agent -s)"
#ssh-add ~/.ssh/github_ed25519 &>/dev/null

# for git issues
# $ eval "$(ssh-agent -s)"
# $ ssh-add ~/.ssh/github_ed25519`
