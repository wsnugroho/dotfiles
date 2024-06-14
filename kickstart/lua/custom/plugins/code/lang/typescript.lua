local M = {}

M.lsp = "tsc"
M.formatter = { "prettier" }
M.linter = { "eslint" }

function M.setup(capabilities)
  local lsp = require("typescript-tools")

  lsp.setup({
    capabilities,
  })
end

return M
