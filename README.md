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
