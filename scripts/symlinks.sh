#!/bin/bash
# Symlink contents of ./home to $HOME and ./.config to $HOME/.config

DIR=$HOME/dotfiles
HOMEDIR=$DIR/home/*
CONFDIR=$DIR/.config/*

# Do this or it will work for files starting with a .
shopt -s dotglob

printf "Linking home directory dotfiles...\n"
for file in $HOMEDIR
do
	printf "Linking $file to $HOME/$(basename $file)\n"
	ln -sf $file $HOME/
done
printf "Linking .config directory dotfiles...\n"
for file in $CONFDIR
do
	printf "Linking $file to $HOME/.config/$(basename $file)\n"
	ln -sf $file $HOME/.config/
done
