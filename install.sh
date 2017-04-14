#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/.dotfiles
############################

# Variables
dotfiles=~/.dotfiles                                                                          # dotfiles directory
backup=~/.dotfiles/backup                                                                     # dotfiles backup directory
files="minttyrc babunrc vim vimrc nanorc zshrc tmux.conf zsh curlrc wgetrc screenrc aliases"  # list of files/folders to symlink in homedir

# create ~/.dotfiles/backup
echo "Creating $backup for backup of any existing dotfiles in ~"
mkdir -p $backup
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dotfiles directory"
cd $dotfiles
echo "...done"

# move any existing dotfiles in homedir to backup directory, then create symlinks
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $backup"
    mv ~/.$file $backup
    echo "Creating symlink to $file in home directory."
    ln -s $dotfiles/$file ~/.$file
done
