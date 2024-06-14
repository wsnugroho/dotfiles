return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      scope = {
        show_start = false,
        show_end = false,
      }
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
  },

}
