return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration
  },
  cmd = 'Neogit',
  config = function()
    require('neogit').setup {
      kind = 'split',
      integrations = { diffview = true },
    }
  end,
}
