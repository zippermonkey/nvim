return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  keys = {
    { '<leader>te', ':NvimTreeToggle<CR>', mode = 'n', desc = '[T]oggle file tr[e]e' },
  },
  config = function()
    require('nvim-tree').setup {}
  end,
}
