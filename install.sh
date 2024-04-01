#!/bin/bash
# Run scripts for fresh installation

SCRDIR=$HOME/dotfiles/scripts

# Symlinks
echo "Creating symlinks..."
stow . -v
# Install dependencies
echo "Installing dependencies..."
$SCRDIR/dependencies.sh
# Install projects
echo "Downloading projects..."
$SCRDIR/projects.sh

echo "Done!"
