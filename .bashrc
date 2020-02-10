#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
#PS1='\e[0;31m[\u@\h \W]\$ \e[m'

# Enable tab completion
source ~/git-completion.bash

# colors!
red="\[\033[0;31m\]"
green="\[\033[0;32m\]"
blue="\[\033[0;34m\]"
purple="\[\033[0;35m\]"
reset="\[\033[0m\]"

# Change command prompt
source ~/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
# '\u' adds the name of the current user to the prompt
# '\$(__git_ps1)' adds git-related stuff
# '\W' adds the name of the current directory
export PS1="$red\u@\h$green\$(__git_ps1)$reset \W \$ "

cat $HOME/.config/wpg/sequences 

export PATH=$PATH:/usr/local/mcuxpresso-ide/ide/

export PATH=$PATH:/usr/bin/core_perl/

export HISTCONTROL=ignoredups

export QT_QPA_PLATFORMTHEME="qt5ct"

bind '"\e[A": history-search-backward'

bind '"\e[B": history-search-forward'
