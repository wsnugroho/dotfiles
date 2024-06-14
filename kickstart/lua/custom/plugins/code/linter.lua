return {
  "mfussenegger/nvim-lint",
  config = function()
    require("lint").linters_by_ft = {
      gitcommit = { "commitlint" },
      golang = require("golang").linters,
      javascript = require("typescript").linters,
      typescript = require("typescript").linters,
    }

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
