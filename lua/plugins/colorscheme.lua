return {
  'Mofiqul/vscode.nvim',
  config = function()
    require('vscode').setup {
      -- Enable italic comment
      italic_comments = true,
      -- Underline `@markup.link.*` variants
      underline_links = true,
      -- Disable nvim-tree background color
      disable_nvimtree_bg = true,
    }
    vim.cmd.colorscheme 'vscode'
  end,
}
