return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = require("lua").formatters,
      python = require("python").formatters,
      golang = require("golang").formatters,
      javascript = require("typescript").formatters,
      typescript = require("typescript").formatters,
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
