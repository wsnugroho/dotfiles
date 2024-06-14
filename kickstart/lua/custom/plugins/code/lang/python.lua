local M = {}

M.lsp = "pyright"
M.formatter = { "black" }
M.linter = { "ruff" }

function M.setup(capabilities)
  local lsp = require("lspconfig").pyright

  lsp.setup({
    capabilities,
  })
end

return M
