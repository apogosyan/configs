source ~/.git-completion.bash
source ~/.git-prompt.sh

#export PS1='\w$ '
export PS1='\[\033[01;32m\]\[\033[01;34m\]\w\[\033[0;36m\]$(__git_ps1)\[\033[1;32m\] λ\[\033[00m\] '

export EDITOR='vim'

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'
alias ll='ls -alF'
alias la='ls -A'
alias lh='ls -lah'
alias ta='tmux a || tmux'

export PATH="/Users/alex/bin:/usr/local/opt/python/libexec/bin:$PATH"
