#!/usr/bin/env python3

# @todo check for vimrc file and create it if necessary

import os, subprocess, shutil, sys

# shell command helper function
def shell(command):
    proc = subprocess.Popen(command, stdout=subprocess.PIPE, shell=True)
    (out, err) = proc.communicate()
    print(command)
    if out:
          print(out)

# get root path for dotfiles repo
root = os.path.dirname(os.path.realpath(__file__))

# add source statements to rc files if they're not there already
def source(targ, dest):
    targ_path = os.path.expanduser("~/.%s" % (targ))
    source_cmd = "source %s" %(os.path.join(root, dest))
    
    shell('touch %s' % (targ_path))
    
    if source_cmd not in open(targ_path).read():
        shell('echo "\n%s" >> %s' % (source_cmd, targ_path))
        
source("bashrc", "bashrc")
source("bash_profile", "bashrc")
source("vimrc", "vimrc")

# set up git config file includes
shell('git config --global core.excludesfile %s' % (os.path.join(root, "gitignore")))
shell('git config --global include.path %s' % (os.path.join(root, "gitconfig")))

# symlink files that can't be sourced
proto = 'ln -sf %s ~/.%s' % (os.path.join(root, "%s"), "%s")
shell(proto % ("tmux.conf", "tmux.conf"))
shell(proto % ("inputrc", "inputrc"))

# add Vim backup and swap directories
shell('mkdir -p ~/.vim-swap')
shell('mkdir -p ~/.vim-tmp')

# create config file using default version
proto = os.path.join(root, "%s")
shutil.copyfile(proto % ("dotfiles.cfg.default"), proto %("dotfiles.cfg"))

# exit cleanly
sys.exit(0)
