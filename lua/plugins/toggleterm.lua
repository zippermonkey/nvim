return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {
    -- size can be a number or function which is passed the current terminal
    size = function(term)
      if term.direction == "horizontal" then
        return 15
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
    end,
    -- 终端打开/关闭的快捷键
    open_mapping = [[<C-t>]],
    -- 在终端模式下也应用这个快捷键
    terminal_mappings = true,
    -- 在插入模式中也应用这个快捷键
    insert_mappings = true,
    -- 隐藏行号
    hide_numbers = true,
    -- 终端着色效果
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    close_on_exit = true,
    -- 默认方向
    direction = 'horizontal',
    -- 保存终端大小
    persist_size = true,
    persist_mode = true,
  },
  keys = {
    -- 水平终端（底部）
    { '<leader>th', '<cmd>ToggleTerm direction=horizontal<cr>', desc = '[T]erminal [H]orizontal' },
    -- 垂直终端（右侧）
    { '<leader>tv', '<cmd>ToggleTerm direction=vertical<cr>', desc = '[T]erminal [V]ertical' },
    -- 浮动终端
    { '<leader>tf', '<cmd>ToggleTerm direction=float<cr>', desc = '[T]erminal [F]loat' },
  },
}
