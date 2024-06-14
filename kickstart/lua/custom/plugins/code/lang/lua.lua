local M = {}

M.lsp = "lua_ls"
M.formatter = {}
M.linter = {}

function M.setup(capabilities)
  local lsp = require("lspconfig").lua_ls
  local neodev = require("neodev")

  neodev.setup({})
  lsp.setup({
    capabilities,
    Lua = {
      workspace = {
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
      diagnostics = {
        disable = { "missing-fields" },
      },
    },
  })
end

return M
