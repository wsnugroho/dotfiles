return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- stylua: ignore
  keys = {
    -- Buffers and Files
    { "<leader>ff", function() require("fzf-lua").files() end, mode = "n", desc = "Find files" },
    { "<leader>fb", function() require("fzf-lua").buffers() end, mode = "n", desc = "Find buffers" },

    -- Search
    { "<leader>fg", function() require("fzf-lua").live_grep() end, mode = "n", desc = "Grep" },
    { "<leader>fw", function() require("fzf-lua").grep_cword() end, mode = "n", desc = "Grep current word" },

    -- -- LSP and Diagnostics
    -- { "gd", function() require("fzf-lua").lsp_definitions() end, mode = "n", desc = "Go to definitions" },
    -- { "gt", function() require("fzf-lua").lsp_typedefs() end, mode = "n", desc = "Go to type definitions" },
    -- { "gD", function() require("fzf-lua").lsp_declarations() end, mode = "n", desc = "Go to declarations" },
    -- { "gr", function() require("fzf-lua").lsp_references() end, mode = "n", desc = "Go to references" },
    -- { "gi", function() require("fzf-lua").lsp_implementations() end, mode = "n", desc = "Go to implementations" },
    -- { "<leader>la", function() require("fzf-lua").lsp_code_actions() end, mode = "n", desc = "Code actions" },
    -- { "<leader>ls", function() require("fzf-lua").lsp_document_symbols() end, mode = "n", desc = "Document symbols" },
    -- { "<leader>lS", function() require("fzf-lua").lsp_workspace_symbols() end, mode = "n", desc = "Workspace symbols" },
    -- { "<leader>ld", function() require("fzf-lua").lsp_document_diagnostics() end, mode = "n", desc = "Document diagnostics" },
    -- { "<leader>lD", function() require("fzf-lua").lsp_workspace_diagnostics() end, mode = "n", desc = "Workspace diagnostics" },

    -- Misc
    { "<leader>tr", function() require("fzf-lua").resume() end, mode = "n", desc = "Resume" },
    { "<leader>f:", function() require("fzf-lua").builtin() end, mode = "n", desc = "Builtins" },
    { "<leader>f'", function() require("fzf-lua").marks() end, mode = "n", desc = "Marks" },
    { "<leader>fh", function() require("fzf-lua").help_tags() end, mode = "n", desc = "Help tags" },
    { "<leader>fH", function() require("fzf-lua").highlights() end, mode = "n", desc = "Highlights" },
    { "<leader>fc", function() require("fzf-lua").commands() end, mode = "n", desc = "Commands" },
    { "<leader>fC", function() require("fzf-lua").colorschemes() end, mode = "n", desc = "Colorschemes" },
    { "<leader>fk", function() require("fzf-lua").keymaps() end, mode = "n", desc = "Keymaps" },
    { "<leader>fr", function() require("fzf-lua").registers() end, mode = "n", desc = "Registers" },
    { "<leader>fo", function() require("fzf-lua").oldfiles() end, mode = "n", desc = "Oldfiles" },
  },
  opts = {},
}
