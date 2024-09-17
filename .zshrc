source ~/.profile
# Initialize Starship
eval "$(starship init zsh)"
# Get OS specific settings
if [[ "$OSTYPE" == "darwin"* ]]; then
	# Set default editor
	export EDITOR=/usr/local/bin/nvim
	export VISUAL=/usr/local/bin/nvim
	alias cat="bat -n"
else
	alias cat="batcat -n"
	export EDITOR=/usr/local/bin/nvim
	export VISUAL=/usr/local/bin/nvim
fi
# Yazi wrapper
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

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
alias nvchad="NVIM_APPNAME=nvchad nvim"

eval "$(zoxide init zsh)"
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
export WINPROJ="/mnt/c/Users/Ben - Work/Projects"
export PATH=$HOME/.local/venv/bin:$PATH
