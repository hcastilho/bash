#
# ~/.bashrc
#

source /etc/profile
#source /usr/etc/profile.d/autojump.bash

# VI mode
set -o vi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#PS1='[\u@\h \W]\$ '
shopt -s checkwinsize

export TERM="xterm-256color"

eval "$(fasd --init auto)"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export WORKON_HOME="$HOME/.virtualenvs"
#export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2
source /usr/bin/virtualenvwrapper.sh

export PYTHONPATH=$PYTHONPATH:~/Development/google_appengine
#export PATH=/usr/local/n/versions/0.8.21/bin:$PATH
export PATH=$PATH:~/scripts/:
export PATH=$PATH:~/Development/google_appengine:
export PATH=$PATH:/opt/android-sdk/tools:/opt/android-sdk/tools:
export PATH=$PATH:~/Development/heroku-client/bin:
export PATH=$PATH:~/.gem/ruby/2.0.0/bin:
#export PATH=$PATH:./node_modules/.bin:
#export NODE_PATH=/usr/local/lib/jsctags/:$NODE_PATH
#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig

# don't put duplicate lines or empty spaces in the history
export HISTCONTROL=ignoreboth
# combine multiline commands in history
shopt -s cmdhist
# merge session histories
shopt -s histappend

alias vi='vim'
#alias vi='vim -p'
#alias vim='vim -p'

alias ackpy='ack --smart-case --python'
alias ackjs='ack --smart-case --js'
alias ackhtml='ack --smart-case --html'
alias ackcss='ack --smart-case --css --sass --less'

# modified commands
alias diff='colordiff'              # requires colordiff package
alias grep='grep -n --color=auto'
alias more='less'
alias df='df -h'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias ping='ping -c 5'
alias ..='cd ..'

# new commands
alias utar='tar -zxvf'
alias da='date "+%A, %B %d, %Y [%T]"'
alias du1='du --max-depth=1'
alias hist='history | grep $1'      # requires an argument
alias openports='netstat --all --numeric --programs --inet --inet6'
alias pg='ps -Af | grep $1'         # requires an argument (note: /usr/bin/pg is installed by the util-linux package; maybe a different alias name should be used)

# privileged access
#if [ $UID -ne 0 ]; then
#    alias sudo='sudo '
#    alias scat='sudo cat'
#    alias svim='sudo vim'
#    alias svi='sudo vim'
#    alias root='sudo su'
#    alias reboot='sudo reboot'
#    alias halt='sudo halt'
#    alias update='sudo pacman -Su'
#    alias netcfg='sudo netcfg2'
#fi

# ls
alias ls='ls --color=auto'
alias ls='ls -hF --color=auto'
alias lr='ls -R'                    # recursive ls
alias ll='ls -l'
alias la='ll -A'
alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date
alias lm='la | more'

# safety features
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'                    # 'rm -i' prompts for every file
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# pacman aliases (if applicable, replace 'pacman' with 'yaourt'/'pacaur'/whatever)
alias pac="sudo pacman -S"      # default action     - install one or more packages
alias pacu="sudo pacman -Syu"   # '[u]pdate'         - upgrade all packages to their newest version
alias pacs="pacman -Ss"    # '[s]earch'         - search for a package using one or more keywords
alias paci="pacman -Si"    # '[i]nfo'           - show information about a package
alias pacr="sudo pacman -Runs"     # '[r]emove'         - uninstall one or more packages
alias pacl="pacman -Sl"    # '[l]ist'           - list all packages of a repository
alias pacll="pacman -Qqm"  # '[l]ist [l]ocal'   - list all packages which were locally installed (e.g. AUR packages)
alias paclo="pacman -Qdt"  # '[l]ist [o]rphans' - list all packages which are orphaned
alias paco="pacman -Qo"    # '[o]wner'          - determine which package owns a given file
alias pacf="pacman -Ql"    # '[f]iles'          - list all files installed by a given package
alias pacc="pacman -Sc"    # '[c]lean cache'    - delete all not currently installed package files
alias pacm="makepkg -fci"  # '[m]ake'           - make package from PKGBUILD file in current directory

