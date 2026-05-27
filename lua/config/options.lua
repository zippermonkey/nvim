vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

vim.opt.number = true
vim.opt.relativenumber = true
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
vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,options'
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.o.cc = '80,100'

vim.o.updatetime = 300
vim.o.timeoutlen = 300
vim.o.mouse = 'a'
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 8
vim.opt.inccommand = 'split'
vim.opt.undofile = true

-- autocmd

-- diagnostic
vim.diagnostic.config {
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = vim.diagnostic.severity.ERROR },
  signs = vim.g.have_nerd_font and {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
  } or {},
  virtual_text = {
    source = 'if_many',
    spacing = 2,
    format = function(diagnostic)
      local diagnostic_message = {
        [vim.diagnostic.severity.ERROR] = diagnostic.message,
        [vim.diagnostic.severity.WARN] = diagnostic.message,
        [vim.diagnostic.severity.INFO] = diagnostic.message,
        [vim.diagnostic.severity.HINT] = diagnostic.message,
      }
      return diagnostic_message[diagnostic.severity]
    end,
  },
}
