if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_config theme choose Catppuccin\ Mocha
    set -g fish_greeting
    abbr -a vi nvim
    abbr -a gst git status
    zoxide init fish | source
end
