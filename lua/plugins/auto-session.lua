return {
  'rmagatti/auto-session',
  config = function()
    require('auto-session').setup {
      auto_session_create_enabled = function()
        local function check_directory_exists(directory_list)
          local current_directory = vim.fn.getcwd()
          for _, directory in ipairs(directory_list) do
            local full_path = current_directory .. '/' .. directory
            if vim.fn.isdirectory(full_path) == 1 then
              return true
            end
          end
          return false
        end
        local directory_list = { '.git', '.project', '.root' }
        return check_directory_exists(directory_list)
      end,
    }
  end,
}
