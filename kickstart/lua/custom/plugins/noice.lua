return {
  "folke/noice.nvim",
  disabled = true,
  event = "VeryLazy",
  dependencies = {
    "hrsh7th/nvim-cmp",
    "MunifTanjim/nui.nvim",
    -- "rcarriga/nvim-notify",
  },
  opts = {
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = false,
    },
    cmdline = {
      enabled = true,
      view = "cmdline_popup",
      format = {
        conceal = false,
      },
    },
    messages = {
      enabled = true,
    },
    popupmenu = {
      enabled = true,
      -- backend = "cmp",
    },
    lsp = {
      progress = {
        enabled = true,
      },
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
      hover = {
        enabled = true,
        silent = false,
      },
      signature = {
        enabled = true,
        auto_open = {
          enabled = true,
          trigger = true,
          luasnip = true,
          throttle = 50,
        },
      },
      documentation = {
        view = "hover",
        opts = {
          min_size = 10,
          max_size = 50,
          relative = "cursor",
          border = {
            style = "single",
            padding = { 1, 1 },
          },
          win_options = {
            wrap = true,
          },
        },
      },
    },
  },
}
