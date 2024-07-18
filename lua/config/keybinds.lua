vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap('', '<Space>', '<Nop>', opts)
keymap('i', 'jj', '<ESC>', opts)
keymap('i', 'kk', '<ESC>', opts)

-- for window manage
keymap('n', '<leader>sv', ':vsp<CR>', opts)
keymap('n', '<leader>ss', ':sp<CR>', opts)
keymap('n', '<leader>wc', '<C-w>c', opts)
keymap('n', '<leader>wh', '<C-w>h', opts)
keymap('n', '<leader>wj', '<C-w>j', opts)
keymap('n', '<leader>wk', '<C-w>k', opts)
keymap('n', '<leader>wl', '<C-w>l', opts)

keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- for tab
keymap('n', '<leader>tc', ':tabc<cr>', opts)

-- for indent
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)
