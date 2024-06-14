return {
  {
    "williamboman/mason.nvim",
    keys = {
      { "<leader>pm", ":Mason", "n" },
      { "<leader>pM", ":MasonUpdate", "n" },
    },
    opts = {
      ui = {
        border = "single",
        width = 0.8,
        height = 0.8,
      },
    },
  },
  {
    "mason-lspconfig.nvim",
    cmd = "LspInstall",
    dependencies = { "williamboman/mason.nvim" },
    opts = {},
  },
}
