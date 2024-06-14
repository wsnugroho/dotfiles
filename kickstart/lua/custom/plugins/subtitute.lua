return {
  "gbprod/substitute.nvim",
  disabled = true,
  -- stylua: ignore
  keys = {
    { "gw", function() require("substitute").operator() end, mode = "n", desc = "Substitute"},
    { "gw", function() require("substitute").visual() end, mode = "v", desc = "Substitute"},
    { "gww", function() require("substitute").line() end, mode = "n", desc = "Substitute line"},
    { "gW", function() require("substitute").eol() end, mode = "n", desc = "Substitute end of line"},
  },
  opts = {},
}
