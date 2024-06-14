-- [[ Setting options ]]
-- See `:help vim.opt`

-- Colors & UI
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.cursorline = true
-- vim.opt.colorcolumn = "100"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.fillchars:prepend("eob: ")

-- Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.breakindent = true

-- Completion
vim.opt.pumheight = 10
vim.opt.pumwidth = 15
vim.opt.completeopt = "menu,menuone,noselect"

-- Split
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Search
vim.opt.smartcase = true
vim.opt.hlsearch = false

-- Misc
vim.opt.clipboard = "unnamed,unnamedplus"
vim.opt.ignorecase = true
vim.opt.mouse = "a"
vim.opt.scrolloff = 5
vim.cmdheight = 0
vim.opt.timeoutlen = 300
vim.opt.undofile = true
vim.opt.updatetime = 250
vim.opt.wrap = true

-- Customizing diagnostic
vim.diagnostic.config({
  virtual_text = true,
})
