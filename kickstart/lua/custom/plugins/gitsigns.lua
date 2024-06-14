return {
  "lewis6991/gitsigns.nvim",
  lazy = false,
  -- stylua: ignore
  keys = {
    { "<leader>ghs", function() require("gitsigns").stage_hunk() end, desc = "Stage hunk" },
    { "<leader>ghr", function() require("gitsigns").reset_hunk() end, desc = "Reset hunk" },
    { "<leader>ghu", function() require("gitsigns").undo_stage_hunk() end, desc = "Undo stage hunk" },
    { "<leader>ghv", function() require("gitsigns").preview_hunk() end, desc = "Preview hunk"},
    { "<leader>ghd", function() require("gitsigns").diff_this() end, desc = "Diff this" },
  },
  opts = {
    preview_config = {
      border = "single",
      relative = "cursor",
      row = 0,
      col = 1,
    },
  },
}
