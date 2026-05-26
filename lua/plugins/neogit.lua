return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration
  },
  cmd = 'Neogit',
  keys = {
    { '<leader>gg', '<cmd>Neogit<cr>', mode = 'n', desc = '[G]it status' },
  },
  config = function()
    require('neogit').setup {
      kind = 'split',
      integrations = { diffview = true },
    }
  end,
}
