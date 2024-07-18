return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = { 'html', 'css', 'vim', 'lua', 'javascript', 'typescript', 'tsx', 'c', 'rust', 'python' },
      auto_install = true,
      highlight = {
        enable = true,
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<CR>', -- set to `false` to disable one of the mappings
          node_incremental = '<CR>',
          scope_incremental = '<TAB>',
          node_decremental = '<BS>',
        },
      },
    }
  end,
}
