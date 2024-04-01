#!/bin/bash
# Install dependencies

# Tmux Plugin Manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# Zsh Plugins
## Zsh Autocomplete
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git ~/.zsh/autocomplete
## Zsh syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/syntax-highlighting
