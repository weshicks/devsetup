export CLICOLOR=1  # same as 'alias ls=ls -G' which I also have set
#export LSCOLORS=exfxcxdxbxegedabagacad

export LSCOLORS=gxfxcxdxbxegedabagacad

# Enable color in grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'

# History: don't store duplicates
export HISTCONTROL=erasedups
# History: 10,000 entries
export HISTSIZE=10000

alias phpx='XDEBUG_CONFIG="profiler_enable=1" php'
alias locate="mdfind -name $1"
alias gf='git-flow'
alias redis-start='sudo launchctl start io.redis.redis-server'
alias redis-stop='sudo launchctl stop io.redis.redis-server'

# general shortcuts
# alias c='cd '
alias mv='mv -i'
alias rm='rm -i'

# Need to do this so you use backspace in screen...I have no idea why
alias screen='TERM=screen screen'

# listing files
alias l='ls -al'
alias ltr='ls -ltr'
alias lth='l -t|head'
alias lh='ls -Shl | less'
alias tf='tail -f -n 100'

# editing shortcuts
alias m='mate'
alias v='vim'
alias sublime='open -a "/Applications/Sublime Text 2.app"'

# grep for a process
function psg {
  FIRST=`echo $1 | sed -e 's/^\(.\).*/\1/'`
  REST=`echo $1 | sed -e 's/^.\(.*\)/\1/'`
  ps aux | grep "[$FIRST]$REST"
}

# Thanks to Geoffrey's peepcode for many of these
alias g='git '
alias gst='git status'
alias gs='git status'
alias gl='git pull'
alias gp='git push'
alias gd='git diff'
alias gdh='git diff HEAD'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gb='git branch'
alias gba='git branch -a'
alias gcap='git commit -v -a && git push'
alias gpp='git pull; git push'

# For when you are stuck between worlds...
#alias gsd='git svn dcommit'
#alias gsr='git svn rebase'


# top level folder shortcuts
alias www='cd /usr/share/www'
alias www:bi='cd /usr/share/www/base_includes'
alias www:h='cd /usr/share/www/hailo'
alias ds='cd /Users/jupiter/Devspace/'
alias docwww='cd /Users/jupiter/Devspace/www'
alias devspace='cd /Users/jupiter/Devspace'


alias h?="history | grep "

# display battery info on your Mac
# see http://blog.justingreer.com/post/45839440/a-tale-of-two-batteries
alias battery='ioreg -w0 -l | grep Capacity | cut -d " " -f 17-50'


# COLOR STRINGS
        RED="\[\033[0;31m\]"
     ORANGE="\[\033[0;33m\]"
     YELLOW="\[\033[0;33m\]"
      GREEN="\[\033[0;32m\]"
       BLUE="\[\033[0;34m\]"
  LIGHT_RED="\[\033[1;31m\]"
LIGHT_GREEN="\[\033[1;32m\]"
      WHITE="\[\033[1;37m\]"
 LIGHT_GRAY="\[\033[0;37m\]"
 COLOR_NONE="\[\e[0m\]"

function gitprompt () {
	local gitbranch=$(git branch 2>&1 | grep '\*' | sed -e 's/\* //g')
	if [[ "$gitbranch" != "" ]]; then
      PS1="${BLUE}\h${WHITE} [\u] ${LIGHT_GRAY}\w${YELLOW} (${gitbranch}) ${LIGHT_GRAY}: "
    else
      PS1="${BLUE}\h${WHITE} [\u] ${LIGHT_GRAY}\w${YELLOW} ${LIGHT_GRAY}: "
    fi
}
#PROMPT_COMMAND=gitprompt


SSH_KNOWN_HOSTS=( $(cat ~/.ssh/known_hosts | \
  cut -f 1 -d ' ' | \
  sed -e s/,.*//g | \
  uniq | \
  egrep -v [0123456789]) )
SSH_CONFIG_HOSTS=( $(cat ~/.ssh/config | grep "Host " | grep -v "*" | cut -f 2 -d ' ') )

complete -o default -W "${SSH_KNOWN_HOSTS[*]} ${SSH_CONFIG_HOSTS[*]}" ssh

WHOAMI=$(whoami)
export PATH=/usr/local/bin:~/.composer/vendor/bin:/Users/jupiter/Library/Python/2.7/bin:$PATH
export NODE_PATH="/usr/local/bin/node:/usr/local/lib/node_modules:{$WHOAMI}/lib/node_modules"
export NODE_ENV=development
export GOPATH=$HOME/Devspace/go


if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi


source .bash_prompt
