# a few nice shortcuts
alias ls='ls -G'
alias ll='ls -alG'
alias la='ls -AG'
alias grep='grep --color=auto'
alias ..='cd ..'
alias lc='clear && ls'

# starts up tmux in 256 colour mode for powerline and attaches to main session
alias tmux='tmux -2'
alias main_tmux='tmux attach -t main || tmux new_session -s main'

# ignore common commands in history
export HISTIGNORE="&:ls:ll:ll.:l.:exit:clear:pwd"

# setup path for included scripts
INCLUDE_PATH="${BASH_SOURCE[0]%/*}/include"

# setup fuzzy completion script
#source $INCLUDE_PATH/fuzzy_bash_completion/fuzzy_bash_completion
#fuzzy_replace_filedir_xspec
#fuzzy_setup_for_command cd
