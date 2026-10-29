return {
  -- biar explorer gak auto kebuka saat nvim dibuka dengan direktori; oil yang handle
  {
    "folke/snacks.nvim",
    opts = {
      explorer = { replace_netrw = false },
    },
  },
  {
    "stevearc/oil.nvim",
    lazy = false,
    dependencies = {
      "nvim-mini/mini.icons",
      {
        "malewicz1337/oil-git.nvim",
        opts = {
          show_ignored_files = true,
          show_ignored_directories = true,
          symbol_position = "signcolumn",
        },
      },
    },
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "Open parent directory (Oil)" },
    },
    opts = {
      default_file_explorer = true,
      win_options = { signcolumn = "yes:2" },
      view_options = { show_hidden = true },
    },
  },
}
