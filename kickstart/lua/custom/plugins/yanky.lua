return {
  "gbprod/yanky.nvim",
  -- stylua: ignore
  disabled = true,
  keys = {
    { "p", "<Plug>(YankPutAfter)", mode = { "n", "x" } },
    { "P", "<Plug>(YankPutBefore)", mode = { "n", "x" } },
    { "gp", "<Plug>(YankGPutAfter)", mode = { "n", "x" } },
    { "gP", "<Plug>(YankGPutBefore)", mode = { "n", "x" } },

    { "<C-p>", "<Plug>(YankPreviousEntry)", mode = "n" },
    { "<C-n>", "<Plug>(YankNextEntry)", mode = "n" },

    { "]p", "<Plug>(YankyPutIndentAfterLinewise)", mode = "n" },
    { "[p", "<Plug>(YankyPutIndentBeforeLinewise)", mode = "n" },
    { "]P", "<Plug>(YankyPutIndentAfterLinewise)", mode = "n" },
    { "[P", "<Plug>(YankyPutIndentBeforeLinewise)", mode = "n" },

    { ">p", "<Plug>(YankyPutIndentAfterShiftRight)", mode = "n" },
    { "<p", "<Plug>(YankyPutIndentAfterShiftLeft)", mode = "n" },
    { ">P", "<Plug>(YankyPutIndentBeforeShiftRight)", mode = "n" },
    { "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)", mode = "n" },

    { "=p", "<Plug>(YankyPutAfterFilter)", mode = "n" },
    { "=P", "<Plug>(YankyPutBeforeFilter)", mode = "n" },
  },
  opts = {
    highlight = {
      on_put = true,
      on_yank = true,
      timer = 500,
    },
  },
}
