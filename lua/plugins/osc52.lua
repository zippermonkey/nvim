return {
  'ojroques/nvim-osc52',
  keys = {
    { "<leader>c",  function() require('osc52').copy_visual() end,   mode = "v", desc = "copy selection" }
  },
  config = function()
    require('osc52').setup {
      max_length = 0,           -- Maximum length of selection (0 for no limit)
      silent = false,           -- Disable message on successful copy
      trim = false,             -- Trim surrounding whitespaces before copy
      tmux_passthrough = false, -- Use tmux passthrough (requires tmux: set -g allow-passthrough on)
    }
  end
}
