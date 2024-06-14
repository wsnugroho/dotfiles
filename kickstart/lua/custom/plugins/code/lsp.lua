return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/nvim-cmp",
    "folke/neodev.nvim",

    -- Custom LSP implementations
    {
      "pmizio/typescript-tools.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
      "mrcjkb/rustaceanvim",
      version = "^4",
    },
    {
      "mfussenegger/nvim-jdtls",
      version = "^4",
    },
  },
  -- stylua: ignore
  keys = {
    { "K", function() vim.lsp.buf.hover() end },
    { "<leader>lr", function() vim.lsp.buf.rename() end },
    { "<leader>lf", function() vim.lsp.buf.format({ async = true }) end },
  },
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    require("lang.lua").setup(cmp_capabilities)
    require("lang.python").setup(cmp_capabilities)
    require("lang.golang").setup(cmp_capabilities)
    require("lang.typescript").setup(cmp_capabilities)
    require("lang.rust").setup(cmp_capabilities)

    -- Setup Golang LSP
    require("lspconfig").gopls.setup({
      capabilities = capabilities,
    })

    -- Setup Typescript/Javascript LSP
    require("typescript-tools").setup({
      capabilities = capabilities,
    })

    -- Setup Rust LSP
    vim.g.rustaceanvim = {
      server = {
        capabilities = capabilities,
      },
    }
  end,
}
