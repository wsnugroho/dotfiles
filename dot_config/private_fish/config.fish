if status is-interactive
    # Commands to run in interactive sessions can go here
    fzf --fish | source
    zoxide init fish | source
    starship init fish | source
    enable_transience
end
