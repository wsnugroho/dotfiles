return {
  "folke/flash.nvim",
  event = "VeryLazy",
  keys = function()
    local function jumpline()
      require("flash").jump({
        search = { mode = "search", max_length = 0 },
        label = { after = { 0, 0 } },
        pattern = "^",
      })
    end

    -- stylua: ignore
    return {
      { "s", function() require("flash").jump() end, mode = { "n", "x", "o" }, desc = "Flash" },
      { "s<space><space>", function() jumpline() end, mode = { "n", "x", "o" }, desc = "Flash line" },
      { "S", function() require("flash").treesitter() end, mode = { "n", "x", "o" }, desc = "Flash treesitter" },
      { "r", function() require("flash").remote() end, mode = { "o" }, desc = "Remote flash" },
      { "R", function() require("flash").treesitter_search() end, mode = { "x", "o" }, desc = "Treesitter search" },
    }
  end,
  opts = {
    modes = {
      char = {
        jump_labels = true,
      },
      treesitter = {
        label = {
          rainbow = {
            enabled = true,
            shade = 5,
          },
        },
      },
    },
    highlight = {
      backdrop = false,
      matches = false,
    },
  },
}
