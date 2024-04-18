source ~/.profile
# Initialize Starship
eval "$(starship init zsh)"
# Set default editor
export EDITOR=/opt/nvim/nvim
export VISUAL=/opt/nvim/nvim

# Autocompletion and syntax highlighting
source ~/.zsh/autocomplete/zsh-autocomplete.plugin.zsh
source ~/.zsh/syntax-highlighting/zsh-syntax-highlighting.zsh

# TODO Set up altuin

# Alias common commands
alias vim="nvim"
alias e="nvim"
alias cat="batcat -n"
alias ls="eza --long --git -a"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias python="~/.local/venv/bin/python3"
alias pip="~/.local/venv/bin/pip3"
