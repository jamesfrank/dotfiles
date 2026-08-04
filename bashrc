# set up paths
DOTFILES_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# get config options
source $DOTFILES_PATH/dotfiles.cfg

# detect OS
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    DF_OS='linux'
elif [[ "$OSTYPE" == "darwin"* ]]; then
    DF_OS='mac'
elif [[ "$OSTYPE" == "cygwin" ]]; then
    DF_OS='cygwin'
elif [[ "$OSTYPE" == "win32" ]]; then
    DF_OS='windows'
elif [[ "$OSTYPE" == "freebsd"* ]]; then
    DF_OS='freebsd'
else
    DF_OS='unknown'
fi

# source standard components
source $DOTFILES_PATH/bash_alias

# get colour support for 'less'
export LESS="--RAW-CONTROL-CHARS"

# use colours for less, man, etc.
[[ -f $DOTFILES_PATH/LESS_TERMCAP ]] && . $DOTFILES_PATH/LESS_TERMCAP

# pick prompt character based on config
if [[ $dotfiles_fancy_characters == 1 ]]; then
    prompt_glyph='❯'
else
    prompt_glyph='>'
fi

# customize prompt
color='\[\e[0;36m\]'
reset='\[\e[0m\]'
bold='\[\e[1m\]'
export PS1="$color\h$reset $bold\W$prompt_glyph$reset "

# ignore common commands in history
export HISTIGNORE="&:ls:ll:ll.:l.:exit:clear:c:pwd"

# suppress macos zsh message
export BASH_SILENCE_DEPRECATION_WARNING=1
