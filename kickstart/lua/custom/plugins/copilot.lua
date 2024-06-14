return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      panel = {
        enabled = false,
      },
      suggestion = {
        enabled = false,
      },
    },
  },

  {
    "zbirenbaum/copilot-cmp",
    main = "copilot_cmp",
    opts = {},
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    -- stylua: ignore
    keys = {
      { "<leader>ta", function() require("CopilotChat").toggle() end },
    },
    opts = {},
  },
}
