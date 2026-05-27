return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'mason-org/mason.nvim',
    'mason-org/mason-registry',
    'mason-org/mason-lspconfig.nvim',
  },
  event = { 'BufReadPre', 'BufNewFile' },
  keys = {
    -- Non-leader LSP (direct normal-mode keys)
    {
      'gd',
      require('fzf-lua').lsp_definitions,
      mode = 'n',
      desc = 'LSP [d]efinition',
    },
    {
      'gD',
      vim.lsp.buf.declaration,
      mode = 'n',
      desc = 'LSP [D]eclaration',
    },
    {
      'gr',
      require('fzf-lua').lsp_references,
      mode = 'n',
      desc = 'LSP [r]eferences',
    },
    {
      'gi',
      require('fzf-lua').lsp_implementations,
      mode = 'n',
      desc = 'LSP [i]mplementations',
    },
    {
      'gy',
      require('fzf-lua').lsp_typedefs,
      mode = 'n',
      desc = 'LSP t[y]pe definition',
    },
    {
      'K',
      function()
        vim.lsp.buf.hover { border = 'single', max_height = 25, max_width = 120 }
      end,
      desc = 'Hover documentation',
    },

    -- Leader LSP (<leader>l)
    { '<leader>l', group = 'LSP' },
    { '<leader>ld', require('fzf-lua').lsp_definitions, mode = 'n', desc = '[d]efinition' },
    { '<leader>lD', vim.lsp.buf.declaration, mode = 'n', desc = '[D]eclaration' },
    { '<leader>lr', require('fzf-lua').lsp_references, mode = 'n', desc = '[r]eferences' },
    { '<leader>li', require('fzf-lua').lsp_implementations, mode = 'n', desc = '[i]mplementations' },
    { '<leader>lt', require('fzf-lua').lsp_typedefs, mode = 'n', desc = '[t]ype definition' },
    { '<leader>ls', require('fzf-lua').lsp_document_symbols, mode = 'n', desc = 'document [s]ymbols' },
    { '<leader>lS', require('fzf-lua').lsp_live_workspace_symbols, mode = 'n', desc = 'workspace [S]ymbols' },
    { '<leader>ln', vim.lsp.buf.rename, mode = 'n', desc = 're[n]ame' },
    { '<leader>la', vim.lsp.buf.code_action, mode = { 'n', 'x' }, desc = 'code [a]ction' },
  },
  config = function()
    require('mason').setup()
    local mason_lspconfig = require 'mason-lspconfig'
    mason_lspconfig.setup {
      -- ensure_installed = { 'rust_analyzer', 'lua_ls' },
    }
  end,
}
