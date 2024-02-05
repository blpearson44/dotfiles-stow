if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting

alias vim "nvim"
alias cat "bat -n"
alias ls "eza --long --git"

starship init fish | source
