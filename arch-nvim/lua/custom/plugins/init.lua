-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function(opts)
      require('oil').setup(opts)
      vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
    end,
  },
  {
    'monaqa/dial.nvim',
    config = function()
      vim.keymap.set('n', '<C-a>', function()
        require('dial.map').manipulate('increment', 'normal')
      end)
      vim.keymap.set('n', '<C-x>', function()
        require('dial.map').manipulate('decrement', 'normal')
      end)
      vim.keymap.set('n', 'g<C-a>', function()
        require('dial.map').manipulate('increment', 'gnormal')
      end)
      vim.keymap.set('n', 'g<C-x>', function()
        require('dial.map').manipulate('decrement', 'gnormal')
      end)
      vim.keymap.set('v', '<C-a>', function()
        require('dial.map').manipulate('increment', 'visual')
      end)
      vim.keymap.set('v', '<C-x>', function()
        require('dial.map').manipulate('decrement', 'visual')
      end)
      vim.keymap.set('v', 'g<C-a>', function()
        require('dial.map').manipulate('increment', 'gvisual')
      end)
      vim.keymap.set('v', 'g<C-x>', function()
        require('dial.map').manipulate('decrement', 'gvisual')
      end)
    end,
  },
  {
    'mrjones2014/smart-splits.nvim',
    build = './kitty/install-kittens.bash',
    opts = {},
    config = function(opts)
      require('smart-splits').setup(opts)
      -- resizing splits
      vim.keymap.set('n', '<A-h>', require('smart-splits').resize_left)
      vim.keymap.set('n', '<A-j>', require('smart-splits').resize_down)
      vim.keymap.set('n', '<A-k>', require('smart-splits').resize_up)
      vim.keymap.set('n', '<A-l>', require('smart-splits').resize_right)
      -- moving between splits
      vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
      vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
      vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
      vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
      vim.keymap.set('n', '<C-\\>', require('smart-splits').move_cursor_previous)
      -- swapping buffers between windows
      vim.keymap.set('n', '<leader><leader>h', require('smart-splits').swap_buf_left)
      vim.keymap.set('n', '<leader><leader>j', require('smart-splits').swap_buf_down)
      vim.keymap.set('n', '<leader><leader>k', require('smart-splits').swap_buf_up)
      vim.keymap.set('n', '<leader><leader>l', require('smart-splits').swap_buf_right)
    end,
  },
  {
    'kosayoda/nvim-lightbulb',
    opts = {
      autocmd = {
        enabled = true,
      },
      sign = {
        enabled = true,
        text = '@',
      },
    },
  },
  {
    'chrishrb/gx.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
    init = function()
      vim.g.netrw_nogx = 1
    end,
    config = function(opts)
      require('gx').setup(opts)
      vim.keymap.set({ 'n', 'x' }, 'gx', '<CMD>Browse<CR>')
    end,
  },
  {
    'gbprod/yanky.nvim',
    config = function()
      require('yanky').setup()
      vim.keymap.set({ 'n', 'x' }, 'p', '<Plug>(YankyPutAfter)')
      vim.keymap.set({ 'n', 'x' }, 'P', '<Plug>(YankyPutBefore)')
      vim.keymap.set({ 'n', 'x' }, 'gp', '<Plug>(YankyGPutAfter)')
      vim.keymap.set({ 'n', 'x' }, 'gP', '<Plug>(YankyGPutBefore)')
      vim.keymap.set('n', '<c-p>', '<Plug>(YankyPreviousEntry)')
      vim.keymap.set('n', '<c-n>', '<Plug>(YankyNextEntry)')
    end,
  },
  {
    'folke/flash.nvim',
    opts = {},
    -- stylua: ignore
    config = function()
      require('flash').setup()
      vim.keymap.set({'n', 'x', 'o'}, 's', function() require('flash').jump() end, { desc = 'Flash' })
      vim.keymap.set({'n', 'x', 'o'}, 'S', function() require('flash').treesitter() end, { desc = 'Flash Treesitter' })
    end,
  },
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'hrsh7th/nvim-cmp',
    },
    opts = {
      lsp = {
        progress = {
          enabled = false,
        },
        message = {
          enabled = false,
        },
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      presets = {
        long_message_to_split = true,
        lsp_doc_border = true,
      },
    },
  },
  {
    'folke/trouble.nvim',
    branch = 'dev',
    opts = {},
    -- stylua: ignore
    config = function()
      require('trouble').setup()
      vim.keymap.set('n', '<leader>tq', '<CMD>Trouble qflist toggle<CR>', { desc = 'Toggle quickfix list' })
      vim.keymap.set('n', '<leader>tl', '<CMD>Trouble loclist toggle<CR>', { desc = 'Toggle location list' })
    end,
  },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'

      harpoon:setup()

      vim.keymap.set('n', '<leader>a', function()
        harpoon:list():add()
      end)
      vim.keymap.set('n', '<C-e>', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)

      vim.keymap.set('n', '<C-h>', function()
        harpoon:list():select(1)
      end)
      vim.keymap.set('n', '<C-t>', function()
        harpoon:list():select(2)
      end)
      vim.keymap.set('n', '<C-n>', function()
        harpoon:list():select(3)
      end)
      vim.keymap.set('n', '<C-s>', function()
        harpoon:list():select(4)
      end)

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set('n', '<C-S-P>', function()
        harpoon:list():prev()
      end)
      vim.keymap.set('n', '<C-S-N>', function()
        harpoon:list():next()
      end)
    end,
  },
}
