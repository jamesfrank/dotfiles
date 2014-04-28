## My Dotfiles

Just a collection of the settings I like to have on my machine.

### Installation

Clone repo

    git clone https://github.com/jamesfrank/Dotfiles.git ~/.dotfiles
    
Source rc files

    echo "source ~/.dotfiles/bashrc" >> ~/.bashrc
    echo "source ~/.dotfiles/vimrc" >> ~/.vimrc
    
Symlink files that can't be sourced

    ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
    ln -s ~/.dotfiles/inputrc ~/.inputrc
    ln -s ~/.dotfiles/gitconfig ~/.gitconfig
    
Add Vim backup and swap directories

    mkdir ~/.vim-swap && mkdir ~/.vim-tmp
