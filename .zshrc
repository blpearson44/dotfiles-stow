source ~/.profile
# Initialize Starship
eval "$(starship init zsh)"
# Set default editor
export EDITOR=/opt/nvim/nvim
export VISUAL=/opt/nvim/nvim
# Get OS


# Autocompletion and syntax highlighting
source ~/.zsh/autocomplete/zsh-autocomplete.plugin.zsh
source ~/.zsh/syntax-highlighting/zsh-syntax-highlighting.zsh

# TODO Set up altuin

# Alias common commands
alias vim="nvim"
alias e="nvim"
alias ls="eza --long --git -a"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias python="~/.local/venv/bin/python3"
alias pip="~/.local/venv/bin/pip3"
if [[ "$OSTYPE" == "darwin"* ]]; then
	alias cat="bat -n"
else
	alias cat="batcat -n"
fi
