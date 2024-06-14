fish_add_path -p $HOME/.cargo/bin
fish_add_path -a $GOROOT/bin $GOPATH/bin (go env GOPATH)/bin

if status is-interactive
    zoxide init fish | source
    starship init fish | source
    enable_transience
end
