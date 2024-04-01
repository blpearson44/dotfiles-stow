# Initialize Starship
eval "$(starship init zsh)"
# Set default editor
export EDITOR=/usr/local/bin/nvim
export VISUAL=/usr/local/bin/nvim

# Autocompletion and syntax highlighting
source ~/.zsh/autocomplete/zsh-autocomplete.plugin.zsh
source ~/.zsh/syntax-highlighting/zsh-syntax-highlighting.zsh

# TODO Set up altuin

# Alias common commands
alias vim="nvim"
alias e="nvim"
alias cat="bat -n"
alias ls="eza --long --git"
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
