return {
  {
    "williamboman/mason.nvim",
    opts = { ui = { border = "single", width = 0.8, height = 0.8 } },
  },
  {
    "williamboman/mason.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    opts = {},
  },

  -- Custom Lsp --
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
  },
  -- Custom Lsp --

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      -- Custom Lsp config
      "folke/neodev.nvim",
      "pmizio/typescript-tools.nvim",
      "mrcjkb/rustaceanvim",

      -- Tools
      "ibhagwan/fzf-lua",
    },
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

          -- stylua: ignore
          local opts = { buffer = ev.buf }

          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
          vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)

          vim.keymap.set("n", "gd", require("fzf-lua").lsp_definitions, opts)
          vim.keymap.set("n", "gD", require("fzf-lua").lsp_declarations, opts)
          vim.keymap.set("n", "gt", require("fzf-lua").lsp_typedefs, opts)
          vim.keymap.set("n", "gr", require("fzf-lua").lsp_references, opts)
          vim.keymap.set("n", "gi", require("fzf-lua").lsp_implementations, opts)
          vim.keymap.set("n", "<leader>ls", require("fzf-lua").lsp_document_symbols, opts)
          vim.keymap.set("n", "<leader>lS", require("fzf-lua").lsp_workspace_symbols, opts)
          vim.keymap.set("n", "<leader>ld", require("fzf-lua").lsp_document_diagnostics, opts)
          vim.keymap.set("n", "<leader>lD", require("fzf-lua").lsp_workspace_diagnostics, opts)
          -- vim.keymap.set("n", "<leader>la", require("fzf-lua").lsp_codeactions, opts)
        end,
      })

      -- [[ Create Custom LSP Capabilities ]]
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      -- Setup Lua LSP
      require("neodev").setup()
      require("lspconfig").lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            diagnostics = { disable = { "missing-fields" } },
          },
        },
      })

      -- Setup Python LSP
      require("lspconfig").pyright.setup({
        capabilities = capabilities,
      })

      -- Setup Golang LSP
      require("lspconfig").gopls.setup({
        capabilities = capabilities,
        settings = {
          gopls = {
            ui = {
              semanticTokens = true,
            },
            completion = {
              usePlaceholders = true,
            },
          },
        },
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
  },

  -- Formatters
  {
    "stevearc/conform.nvim",
    lazy = false,
    -- stylua: ignore
    keys = {
      { "<leader>lf", function() require("conform").format({ async = true, lsp_fallback = true }) end, mode = "n", desc = "Format" },
    },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        go = { "gofumpt", "goimports" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        python = { "isort", "black" },
        ["*"] = { "trim_newlines", "trim_whitespaces" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    },
  },

  -- Linters
  {
    "mfussenegger/nvim-lint",
    config = function()
      require("lint").linters_by_ft = {
        -- lua = { "luacheck" },
        javascript = { "eslintd" },
        typescript = { "eslintd" },
        gitcommit = { "commitlint" },
      }

      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },
}
