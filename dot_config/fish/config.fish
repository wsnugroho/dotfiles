source /usr/share/cachyos-fish-config/cachyos-config.fish

# Optional Qt theming.
# set -gx QT_QPA_PLATFORMTHEME qt6ct
# set -gx QT_STYLE_OVERRIDE adwaita

# Environment
set -gx EDITOR nvim
set -gx VISUAL code
set -gx SSH_AUTH_SOCK /home/wsnugroho/.bitwarden-ssh-agent.sock

# Disable the default greeting
function fish_greeting; end

# Command-line tools
zoxide init fish | source
mise activate fish | source

