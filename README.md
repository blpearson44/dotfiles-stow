# Ben Pearson's Dotfiles
## Description
This repository contains my configuration files for my linux configuration files. 
At the moment this includes three libraries, but may be increased.
### ./.config
This is where most applications will store their configuration files. The files or and directories here will be symlinked to `$HOME/.config`
### ./home
Some applications or general configuration files will live under the home directory (like `.bashrc` or `.profile`). This will be symlinked to the home directory under `$HOME`
## Usage
Simply clone this repository to the location of your choice and then run `./symlinks.sh`. It will iteratively run through the `./home` and `./.config` directories symlinking each of the files there. It will print to the console each file it symlinks. Note that this is based on each of the files under those two directories, if more are added then `./symlinks.sh` should be updated. Additionally, it will also symlink additional items put into those repositories even if they are ignored by git.
### WIP
I am currently working on having my Nix flake automatically clone this repository and symlink these files based on the last commit stored under `blpearson44/flake/dothash`
If this is being used, then running the dotfiles script under the flake repository will update the commit ID stored.

## TODO
- [ ] Investigate altuin
- [ ] Investigate chezmoi

