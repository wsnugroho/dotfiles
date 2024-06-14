-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- [[ Setting options ]]
-- See `:help vim.opt`
require("user.settings")

-- [[ Basic Keymaps ]]
-- See `:help vim.keymap.set()`
require("user.keymaps")
require("user.commands")

-- [[ Install `lazy.nvim` plugin manager ]]
-- See `:help lazy.nvim.txt`
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- [[ Configure plugins ]]
require("lazy").setup("custom.plugins", {
  change_detection = {
    notify = false,
  },
  ui = {
    border = "single",
  },
})

-- [[ Set default colorscheme ]]
vim.cmd([[colorscheme gruvbox]])
