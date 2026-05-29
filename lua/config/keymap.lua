local function keymap(m, k, v, desc)
  vim.keymap.set(m, k, v, { silent = true, desc = desc, noremap = true })
end

keymap('', '<Space>', '<Nop>', 'unset <space>')
keymap('i', 'jj', '<ESC>', 'quick back to normal mode')
keymap('i', 'kk', '<ESC>', 'quick back to normal mode')

keymap('t', 'jj', "<C-\\><C-n>", 'quick back to normal mode')
-- for window manage
keymap('n', '<leader>ws', ':sp<CR>', '[w]indow [s]pilt horizontally')
keymap('n', '<leader>wv', ':vsp<CR>', '[w]indow [s]pilt vertically')
keymap('n', '<leader>wc', '<C-w>c', '[w]indow [c]lose')
keymap('n', '<leader>wh', '<C-w>h', '[w]indow [h]')
keymap('n', '<leader>wj', '<C-w>j', '[w]indow [j]')
keymap('n', '<leader>wk', '<C-w>k', '[w]indow [k]')
keymap('n', '<leader>wl', '<C-w>l', '[w]indow [l]')

keymap('n', '<C-h>', '<C-w>h', '[w]indow [h]')
keymap('n', '<C-j>', '<C-w>j', '[w]indow [j]')
keymap('n', '<C-k>', '<C-w>k', '[w]indow [k]')
keymap('n', '<C-l>', '<C-w>l', '[w]indow [l]')

-- for tab
keymap('n', '<leader>tc', ':tabc<cr>', '[t]ab close')
keymap('n', '<leader>tn', ':tabnext<cr>', '[t]ab next')
keymap('n', '<leader>tp', ':tabprevious<cr>', '[t]ab previous')

-- for buffer
keymap('n', '<leader>bn', ':bnext<cr>', '[b]uffer [n]ext')
keymap('n', '<leader>bp', ':bprevious<cr>', '[b]uffer [p]revious')
keymap('n', '<leader>bd', ':bd<cr>', '[b]uffer [d]elete')

-- for indent
keymap('v', '<', '<gv', '')
keymap('v', '>', '>gv', '')

-- for hlsearch
keymap('n', '<ESC>', ':noh<CR>', '')

-- copy file path with line range (e.g. @foo/bar.py#L12-45) for AI CLI tools
local function copy_file_range()
  local file = vim.fn.expand('%:.') -- relative path
  local start_line = vim.fn.line('v')
  local end_line = vim.fn.line('.')
  if start_line > end_line then
    start_line, end_line = end_line, start_line
  end
  local text
  if start_line == end_line then
    text = '@' .. file .. '#L' .. start_line
  else
    text = '@' .. file .. '#L' .. start_line .. '-' .. end_line
  end
  vim.fn.setreg('+', text)
  vim.notify('Copied: ' .. text, vim.log.levels.INFO, { title = 'AI Ref' })
end
keymap('v', '<leader>y', copy_file_range, '[Y]ank AI file ref')


-- terminal toggle is now handled by toggleterm plugin (C-t)
