#!/bin/bash
############################
# makesymlinks.sh
# This script creates symlinks from the home directory to any desired dotfiles
# in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files=`ls | grep _`

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create
# symlinks
for file in $files; do
	dotfile=`echo $file | sed s/_/./`
        echo "Moving any existing dotfiles from ~ to $olddir"
        mv ~/$dotfile ~/dotfiles_old/
        echo "Creating symlink from $file to $dotfile in home directory."
        ln -s $dir/$file ~/$dotfile
done
