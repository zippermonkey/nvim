return {
  'ibhagwan/fzf-lua',
  -- optional for icon support
  dependencies = { 'nvim-tree/nvim-web-devicons', 'folke/trouble.nvim' },
  keys = {
    { '<leader>ff', '<cmd>FzfLua files<cr>', mode = 'n', desc = '[f]ind [f]iles' },
    { '<leader><leader>', '<cmd>FzfLua files<cr>', mode = 'n', desc = '[f]ind [f]iles' },
    {
      '<leader>fn',
      function()
        require('fzf-lua').files { cwd = vim.fn.stdpath 'config' }
      end,
      desc = '[F]ind [N]eovim files',
    },
    { '<leader>fl', '<cmd>FzfLua<cr>', mode = 'n', desc = '[F]zf[L]ua' },
    { '<leader>fb', '<cmd>FzfLua buffers<cr>', mode = 'n', desc = '[f]ind [b]uffers' },
    { '<leader>fw', '<cmd>FzfLua grep_cword<cr>', mode = 'n', desc = '[f]ind [w]ord' },
    { '<leader>fW', '<cmd>FzfLua grep_cWORD<cr>', mode = 'n', desc = '[f]ind [W]ORD' },
    { '<leader>fg', '<cmd>FzfLua live_grep<cr>', mode = 'n', desc = '[f]ind something with live [g]rep' },
    { '<leader>f/', '<cmd>FzfLua lgrep_curbuf<cr>', mode = 'n', desc = '[f]ind in this buffer' },
    { '<leader>fk', '<cmd>FzfLua keymaps<cr>', mode = 'n', desc = '[f]ind [k]eymaps' },
    { '<leader>rr', '<cmd>FzfLua resume<cr>', mode = 'n', desc = '[r]esume sea[r]ch' },
  },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "nvim-mini/mini.icons" },
  opts = {},
  config = function()
    local config = require 'fzf-lua.config'
    local actions = require('trouble.sources.fzf').actions
    config.defaults.actions.files['ctrl-t'] = actions.open
  end,
}
