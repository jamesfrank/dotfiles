## My Dotfiles

Just a collection of the settings I like to have on my machine.

### Installation

Clone repo

    git clone https://github.com/jamesfrank/Dotfiles.git ~/.dotfiles
    
#### Automated Setup

    ~/.dotfiles/install.py
    
#### Manual Setup

    cd ~/.dotfiles
    
Source rc files

    echo "source ~/.dotfiles/bashrc" >> ~/.bashrc
    echo "source ~/.dotfiles/vimrc" >> ~/.vimrc
    
Symlink files that can't be sourced

    ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
    ln -s ~/.dotfiles/inputrc ~/.inputrc
    
Set up git config files

    git config --global core.excludesfile ~/.dotfiles/gitignore
    git config --global include.path ~/.dotfiles/gitconfig
    
Add Vim backup and swap directories

    mkdir -p ~/.vim-swap
    mkdir -p ~/.vim-tmp

Create config file (modify this file to enable or disable various features)

    cp dotfiles.cfg.default dotfiles.cfg

## Optional Steps

### Vim Setup

    git clone https://github.com/drmikehenry/vimfiles.git ~/.vim
    ~/.vim/setup.py

### Fuzzy Completion

These dotfiles used to bundle the old `fuzzy_bash_completion` script for
fuzzy tab completion. It's been removed. The modern replacement is
[fzf](https://github.com/junegunn/fzf), which works on both macOS and
RHEL/Rocky:

    # macOS
    brew install fzf

    # RHEL / Rocky (EPEL)
    sudo dnf install fzf        # if unavailable, enable EPEL: sudo dnf install epel-release

Then enable fzf's key bindings and fuzzy completion for bash. With Homebrew:

    echo 'source <(fzf --bash)' >> ~/.bashrc   # fzf >= 0.48
    # older fzf: run "$(brew --prefix)/opt/fzf/install"

On RHEL/Rocky the package usually drops the scripts under
`/usr/share/fzf/shell/`; source `key-bindings.bash` and `completion.bash`
from there. This gives `**<TAB>` fuzzy completion plus `Ctrl-T` / `Ctrl-R`.
