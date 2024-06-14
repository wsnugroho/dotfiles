return {
  "stevearc/oil.nvim",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- stylua: ignore
  keys = {
    { "-", function() require("oil").open() end, mode = "n", desc = "Open parent directory" },
  },
  opts = {
    default_file_explorer = true,
  },
}
