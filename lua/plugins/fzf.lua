return {
  'ibhagwan/fzf-lua',
  -- optional for icon support
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  lazy = false,
  keys = {
    { '<leader>ff', '<cmd>FzfLua files<cr>', mode = 'n', desc = '[f]ind [f]iles' },
    { '<leader>rr', '<cmd>FzfLua resume<cr>', mode = 'n', desc = '[r]esume sea[r]ch' },
    { '<leader>fb', '<cmd>FzfLua buffers<cr>', mode = 'n', desc = '[f]ind [b]uffers' },
    { '<leader>bs', '<cmd>FzfLua buffers<cr>', mode = 'n', desc = '[f]ind [b]uffers' },
    { '<leader>fo', '<cmd>FzfLua oldfiles<cr>', mode = 'n', desc = '[f]ind [o]ldfiles' },
    { '<leader>fg', '<cmd>FzfLua live_grep<cr>', mode = 'n', desc = '[f]ind somethinf with live [g]rep' },
    { '<leader>fw', '<cmd>FzfLua grep_cword<cr>', mode = 'n', desc = '[f]ind [w]ord' },
    { '<leader>fW', '<cmd>FzfLua grep_cWORD<cr>', mode = 'n', desc = '[f]ind [W]ORD' },
    { '<leader>fc', '<cmd>FzfLua lgrep_curbuf<cr>', mode = 'n', desc = '[f]ind in [c]urbuf' },

    { '<leader>fd', '<cmd>FzfLua lsp_definitions<cr>', mode = 'n', desc = '[f]ind [d]efinitions with FzfLua' },
    { 'D', '<cmd>FzfLua lsp_definitions<cr>', mode = 'n', desc = '[f]ind [d]efinitions with FzfLua' },
    { '<leader>fD', '<cmd>FzfLua lsp_declarations<cr>', mode = 'n', desc = '[f]ind [D]eclarations with FzfLua' },
    { '<leader>fr', '<cmd>FzfLua lsp_references<cr>', mode = 'n', desc = '[f]ind [r]eferences with FzfLua' },
    { '<leader>ws', '<cmd>FzfLua lsp_live_workspace_symbols<cr>', mode = 'n', desc = '[w]orkspace [s]ymbols with FzfLua' },
    { '<leader>ds', '<cmd>FzfLua lsp_document_symbols<cr>', mode = 'n', desc = '[d]ocument [s]ymbols with FzfLua' },
    { '<leader>wq', '<cmd>FzfLua lsp_live_workspace_symbols<cr>', mode = 'n', desc = '[w]orkspace symbols live [q]uery with FzfLua' },
  },
  config = function()
    -- calling `setup` is optional for customization
    require('fzf-lua').setup {
      winopts = {
        split = 'botright new', -- open in a full-width split on the bottom
      },
    }
  end,
}
