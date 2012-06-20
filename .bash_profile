[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

export PATH=/usr/local/bin:$PATH
BLACK="\[\033[0;30m\]"
DARK_GRAY="\[\033[1;30m\]"
LIGHT_GRAY="\[\033[0;37m\]"
BLUE="\[\033[0;34m\]"
LIGHT_BLUE="\[\033[1;34m\]"
GREEN="\[\033[0;32m\]"
LIGHT_GREEN="\[\033[1;32m\]"
CYAN="\[\033[0;36m\]"
LIGHT_CYAN="\[\033[1;36m\]"
RED="\[\033[0;31m\]"
LIGHT_RED="\[\033[1;31m\]"
PURPLE="\[\033[0;35m\]"
LIGHT_PURPLE="\[\033[1;35m\]"
BROWN="\[\033[0;33m\]"
YELLOW="\[\033[1;33m\]"
WHITE="\[\033[1;37m\]"
DEFAULT_COLOR="\[\033[00m\]"

function parse_git_deleted {
  [[ $(git status 2> /dev/null | grep deleted:) != "" ]] && echo "-"
}
function parse_git_added {
  [[ $(git status 2> /dev/null | grep "Untracked files:") != "" ]] && echo '+'
}
function parse_git_modified {
  [[ $(git status 2> /dev/null | grep modified:) != "" ]] && echo "*"
}
function parse_git_dirty {
  # [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "☠"
  echo "$(parse_git_added)$(parse_git_modified)$(parse_git_deleted)"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

export CLICOLOR=1
if [[ $? = 0 ]]; then
  export PS1='\[\033[0;32m\]\u@\h \[\033[1;34m\]\w \[\033[1;33m\]$(parse_git_branch)$ \[\033[1;00m\]'
else
  export PS1='\[\033[0;31m\]\u@\h \[\033[1;34m\]\w \[\033[1;33m\]$(parse_git_branch)$ \[\033[1;00m\]'
fi


alias bashp='vim ~/.bash_profile'

alias cdf='cd ~/Code/Ruby/Filmbet'
alias cdfs='cd ~/Code/Ruby/Filmbet && rails s'
alias cdfc='cd ~/Code/Ruby/Filmbet && rails c'
alias cde='cd ~/Code/Ruby/episodes'
alias cdes='cd ~/Code/Ruby/episodes && rails s'
alias cdec='cd ~/Code/Ruby/episodes && rails c'
alias e='subl -n .'
alias el='cd ~/Dropbox/Code/lamefriends && subl -n .'
alias dc='cd ~/Code/Ruby'
alias ga='git add .'
alias gc='git commit -m'
alias go='git checkout'
alias gp='git push'
alias gpo='git push origin'
alias gpc='git push corigin'
alias gph='git push heroku'
alias gei="gem install" 
alias c='clear'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
