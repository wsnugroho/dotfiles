return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- stylua: ignore
  keys = {
    { "<leader>tx", function() require("trouble").toggle() end, mode = "n", desc = "Toggle quickfix" },
  },
  opts = {},
}
