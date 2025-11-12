vim.opt.number = true
vim.opt.smartindent = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.signcolumn = 'yes'
vim.g.clipboard = 'osc52'
vim.opt.clipboard = 'unnamedplus'
vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'

-- autocmd
vim.api.nvim_create_autocmd({ 'BufLeave', 'InsertLeave' }, {
  group = vim.api.nvim_create_augroup('AutoSaveOnLeave', { clear = true }),
  callback = function()
    -- 仅当缓冲区被修改且不是只读时才保存
    if vim.bo.modified and not vim.bo.readonly then
      vim.cmd 'write' -- 执行保存命令
    end
  end,
  pattern = { '*' }, -- 适用于所有缓冲区
  desc = 'Auto save on leaving buffer or insert mode',
})
