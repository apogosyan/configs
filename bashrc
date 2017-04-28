export PS1='\w$ '
#export PS1="\[\033[01;32m\][user@server]\[\033[0m\]\w$ "

export EDITOR='vim'

alias ll='ls -alF'
alias la='ls -A'
alias lh='ls -lah'
alias ta='tmux a || tmux'

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/dev
source /usr/local/bin/virtualenvwrapper.sh


