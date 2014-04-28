alias ls='ls --color=auto'
alias ll='ls -al'
alias la='ls -A'
alias grep='grep --color=auto'
alias ..='cd ..'

alias tmux='tmux -2'
alias main_tmux='tmux attach -t main || tmux new_session -s main'

export HISTIGNORE="&:ls:ll:ll.:l.:exit:clear:pwd"
