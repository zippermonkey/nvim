-- return {
--   -- "folke/tokyonight.nvim",
--   'nyoom-engineering/oxocarbon.nvim',
--   lazy = false,
--   priority = 1000,
--   opts = {},
--   config = function()
--     vim.cmd [[colorscheme oxocarbon]]
--   end,
-- }
return {
  'rose-pine/neovim',
  name = 'rose-pine',
  config = function()
    vim.cmd 'colorscheme rose-pine'
  end,
}
