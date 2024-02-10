#!/bin/bash

PROJ_TXT=$HOME/dotfiles/projects.txt
PROJ=$HOME/Projects/

if [ ! -d $PROJ ]; then
  mkdir -p $PROJ;
fi

cd $PROJ

while read p; do 
	git clone $p
done < "$PROJ_TXT"

