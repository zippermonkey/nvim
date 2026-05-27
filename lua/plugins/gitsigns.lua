return {
  'lewis6991/gitsigns.nvim',
  opts = {
    current_line_blame = true,
  },
  event = { 'VeryLazy' },
  cond = function()
    local output = vim.fn.systemlist 'git rev-parse --is-inside-work-tree 2>/dev/null'
    return #output ~= 0
  end,

  keys = {
    { '<leader>gh', '<cmd>Gitsigns preview_hunk<cr>', mode = 'n', desc = 'Preview [H]unk' },
    { 'B', '<cmd>Gitsigns blame_line<cr>', mode = 'n', desc = '[B]lame line' },
  },
}
