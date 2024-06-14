return {
  "folke/which-key.nvim",
  opts = {},
  config = function(_, opts)
    local whichkey = require("which-key")

    whichkey.setup(opts)

    -- document existing key chains
    require("which-key").register({
      ["<leader>l"] = { name = "Lsp", _ = "which_key_ignore" },
      ["<leader>g"] = { name = "Git", _ = "which_key_ignore" },
      ["<leader>f"] = { name = "Search", _ = "which_key_ignore" },
      ["<leader>t"] = { name = "Toggle", _ = "which_key_ignore" },
    })

    -- register which-key VISUAL mode
    -- required for visual <leader>hs (hunk stage) to work
    require("which-key").register({
      ["<leader>"] = { name = "VISUAL <leader>" },
    }, { mode = "v" })
  end,
}
