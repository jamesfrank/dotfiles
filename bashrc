# set up paths
DOTFILES_PATH="${BASH_SOURCE[0]%/*}"
INCLUDE_PATH="$DOTFILES_PATH/include"

# get config options
source $DOTFILES_PATH/dotfiles.cfg

# source standard components
source $DOTFILES_PATH/bash_alias
alias when-changed=$INCLUDE_PATH/when-changed/when-changed

# pick prompt character based on config
if [[ $dotfiles_fancy_characters == 1 ]]; then
    prompt_glyph='>' # @todo fix this
else
    prompt_glyph='>'
fi

# customize prompt
color='\[\e[0;39m\]'
reset='\[\e[0m\]'
bold='\[\e[1m\]'
export PS1="$color\h$reset $bold\W$prompt_glyph$reset "

# ignore common commands in history
export HISTIGNORE="&:ls:ll:ll.:l.:exit:clear:c:pwd"

# setup path for included scripts
INCLUDE_PATH="${BASH_SOURCE[0]%/*}/include"

# setup fuzzy completion script
#source $INCLUDE_PATH/fuzzy_bash_completion/fuzzy_bash_completion
#fuzzy_replace_filedir_xspec
#fuzzy_setup_for_command cd
