return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = function()
    local harpoon = require("harpoon")
    -- stylua: ignore
    return {
    { "<leader>a", function() harpoon.list().append() end, mode = "n" },
    { "<leader>c", function() harpoon.ui.toggle_quick_menu(harpoon.lisp()) end, mode = "n" },
    { "<leader>1", function() harpoon.list().select(1) end, mode = "n" },
    { "<leader>2", function() harpoon.list().select(2) end, mode = "n" },
    { "<leader>3", function() harpoon.list().select(3) end, mode = "n" },
    { "<leader>4", function() harpoon.list().select(4) end, mode = "n" },
    { "<leader>5", function() harpoon.list().select(5) end, mode = "n" },
  }
  end,
  opts = {},
}
