-- Setting neovim options
local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true

-- appearance
opt.termguicolors = true
opt.cursorline = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.colorcolumn = "100"
opt.list = true

--search & replace settings
opt.ignorecase = true
opt.smartcase = true

-- split windows
opt.splitright = true
opt.splitbelow = true

-- persistance undo
opt.undofile = true

-- line wrapping
opt.wrap = false

-- tabs & indentation
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- others
opt.scrolloff = 10
opt.fileformats = "unix"
opt.clipboard:prepend({ "unnamedplus" })

-- backspace
-- opt.backspace = "indent,eol,start"
