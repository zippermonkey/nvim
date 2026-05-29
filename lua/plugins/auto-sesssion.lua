return {
  'rmagatti/auto-session',
  lazy = false,

  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    -- suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    -- log_level = 'debug',
    pre_restore_cmds = {
      function()
        require('nvim-tree.api').tree.close()
      end,
    },
    post_restore_cmds = {
      function()
        require('nvim-tree.api').tree.open()
      end,
    },
  }, -- log_level = 'debug',
}
