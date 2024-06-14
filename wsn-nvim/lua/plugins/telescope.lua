return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- stylua: ignore
    keys = {
      { "<leader><leader>", mode = { "n" }, function() require("fzf-lua").files() end, desc = "Find" },
      { "<leader>ff", mode = { "n" }, function() require("fzf-lua").files() end, desc = "Find Files" },
      { "<leader>fb", mode = { "n" }, function() require("fzf-lua").buffers() end, desc = "Find Buffers" },
      { "<leader>fh", mode = { "n" }, function() require("fzf-lua").help_tags() end, desc = "Find Help Tags" },
    },
    config = function()
      require("fzf-lua").setup()
    end,
  }
}
