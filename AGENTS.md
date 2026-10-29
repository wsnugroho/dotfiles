# AGENTS.md

This is a chezmoi source directory.
Files here (e.g. `dot_config/nvim/`) map to `~` (e.g. `~/.config/nvim/`).
Editing the source does not change the live config until it is applied.

## After making changes

Always sync after creating changes, then report what you actually verified.

1. Apply the changed files: `chezmoi apply <target path>`, e.g.
   `chezmoi apply ~/.config/nvim/lua/plugins/ui.lua`.
   - Apply specific files, not the whole tree.
     A bare `chezmoi apply ~/.config/nvim` can fail on `lazy-lock.json`,
     which changes after every sync and makes chezmoi prompt for a TTY that does not exist.
2. For Neovim plugin changes, sync plugins headless: `nvim --headless "+Lazy! sync" +qa`.
3. Verify headless that the change loads, e.g.
   `nvim --headless "+lua print(pcall(require, '<module>'))" +qa`.

Do not claim a UI result (colors, keymaps, layout) works unless it was seen.
Say it was not checked in the UI.

## Notes

- `lazy-lock.json` is tracked, but plugin syncs rewrite the live copy.
  Pull those changes back into the source with `chezmoi add ~/.config/nvim/lazy-lock.json`.
- Agent skills are not tracked.
  `~/.agents/skills` is the source of truth, managed by `npx skills`;
  only its lock file (`dot_agents/dot_skill-lock.json`) is tracked, and `.chezmoiignore` skips the folder.
  Other agents (e.g. `~/.claude/skills`) should link to it instead of keeping their own copies.
- Do not commit unless asked.
  Commit messages follow `type(scope): message`, e.g. `feat(nvim): add neogit and diffview.nvim`.
