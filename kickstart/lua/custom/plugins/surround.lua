return {
  "kylechui/nvim-surround",
  version = "*",
  event = "VeryLazy",
  opts = {
    keymaps = {
      insert = "<C-g>s",
      insert_line = "<C-g>S",
      normal = "gsa",
      normal_cur = "gsaa",
      normal_line = "gsA",
      normal_cur_line = "gsAA",
      visual = "gs",
      visual_line = "gS",
      delete = "gsd",
      change = "gsc",
      change_line = "gsC",
    },
  },
}
