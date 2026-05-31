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
        -- 关闭所有 toggleterm 终端，避免恢复后状态异常
        pcall(function()
          local terms = require('toggleterm.terminal').get_all()
          for _, term in ipairs(terms) do
            term:close()
          end
        end)
      end,
    },
    post_restore_cmds = {
      function()
        require('nvim-tree.api').tree.open()
        -- 重新加载 toggleterm，确保命令可用
        pcall(function()
          require('toggleterm').setup({})
        end)
        -- session 恢复不触发 BufReadPost/BufNewFile，
        -- 导致懒加载的 treesitter 不会附着到 buffer，需要手动触发
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
          if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buflisted then
            vim.api.nvim_exec_autocmds('BufReadPost', { buffer = buf })
          end
        end
      end,
    },
  }, -- log_level = 'debug',
}
