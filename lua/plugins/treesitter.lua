return {
  -- Parser engine (main branch — parser management only)
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      require('nvim-treesitter').install {
        'html',
        'css',
        'vim',
        'lua',
        'javascript',
        'typescript',
        'tsx',
        'c',
        'rust',
        'python',
      }
    end,
  },

  -- Restore highlight / incremental_selection / fold / indent modules
  {
    'MeanderingProgrammer/treesitter-modules.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      highlight = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<CR>',
          node_incremental = '<CR>',
          scope_incremental = '<TAB>',
          node_decremental = '<BS>',
        },
      },
    },
  },

  -- Semantic text objects (vaf, dif, ]f, [f, etc.)
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = 'main',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      require('nvim-treesitter-textobjects').setup {
        select = { lookahead = true },
        move = { set_jumps = true },
      }

      local select = require 'nvim-treesitter-textobjects.select'
      local move = require 'nvim-treesitter-textobjects.move'

      -- Select text objects (operator-pending + visual mode)
      local select_keys = {
        af = '@function.outer',
        ['if'] = '@function.inner',
        ac = '@class.outer',
        ic = '@class.inner',
      }
      for key, query in pairs(select_keys) do
        vim.keymap.set({ 'x', 'o' }, key, function()
          select.select_textobject(query)
        end, { desc = 'Select ' .. query })
      end

      -- Move between text objects
      vim.keymap.set({ 'n', 'x', 'o' }, ']f', function()
        move.goto_next_start '@function.outer'
      end, { desc = 'Next function start' })
      vim.keymap.set({ 'n', 'x', 'o' }, '[f', function()
        move.goto_previous_start '@function.outer'
      end, { desc = 'Prev function start' })
      vim.keymap.set({ 'n', 'x', 'o' }, ']c', function()
        move.goto_next_start '@class.outer'
      end, { desc = 'Next class start' })
      vim.keymap.set({ 'n', 'x', 'o' }, '[c', function()
        move.goto_previous_start '@class.outer'
      end, { desc = 'Prev class start' })
    end,
  },
}
