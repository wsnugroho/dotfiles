# dotfiles

Managed with [chezmoi](https://chezmoi.io). Secrets (ssh config, opencode API keys) are age-encrypted.

## New machine

1. Install chezmoi: `sudo pacman -S chezmoi`
2. Restore the age key from Bitwarden to `~/.config/chezmoi/key.txt` (`chmod 600`)
3. `chezmoi init --apply <repo-url>`

## Daily use

- Edit: `chezmoi edit ~/.config/fish/config.fish` (or edit in place, then `chezmoi re-add`)
- Check drift: `chezmoi status` / `chezmoi diff`
- Add a secret file: `chezmoi add --encrypt <file>`
- Refresh package lists: `packages/dump.sh`
- Refresh GNOME settings: `dconf/dump.sh`
