return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'mason-org/mason.nvim',
    'mason-org/mason-registry',
    'mason-org/mason-lspconfig.nvim',
  },
  event = { 'BufReadPre', 'BufNewFile' },
  keys = {
    -- Rename the variable under your cursor.
    --  Most Language Servers support renaming across files, etc.
    { '<leader>gn', vim.lsp.buf.rename, mode = 'n', desc = '[R]e[n]ame' },

    -- Execute a code action, usually your cursor needs to be on top of an error
    -- or a suggestion from your LSP for this to activate.
    {
      '<leader>ga',
      vim.lsp.buf.code_action,
      mode = { 'n', 'x' },
      desc = '[G]oto Code [A]ction',
    },

    -- Find references for the word under your cursor.
    {
      '<leader>gr',
      require('fzf-lua').lsp_references,
      mode = 'n',
      desc = '[G]oto [R]eferences',
    },
    {
      '<leader>fr',
      require('fzf-lua').lsp_references,
      mode = 'n',
      desc = '[F]ind [R]eferences',
    },

    -- Jump to the implementation of the word under your cursor.
    --  Useful when your language has ways of declaring types without an actual implementation.
    -- map("<leader>gi", require("fzf-lua").lsp_implementations, "[G]oto [I]mplementation")
    {
      '<leader>gi',
      require('fzf-lua').lsp_implementations,
      mode = 'n',
      desc = '[G]oto [I]mplementation',
    },

    -- Jump to the definition of the word under your cursor.
    --  This is where a variable was first declared, or where a function is defined, etc.
    --  To jump back, press <C-t>.
    -- map("<leader>gd", require("fzf-lua").lsp_definitions, "[G]oto [D]efinition")
    {
      '<leader>gd',
      require('fzf-lua').lsp_definitions,
      mode = 'n',
      desc = '[G]oto [D]efinition',
    },

    -- WARN: This is not Goto Definition, this is Goto Declaration.
    --  For example, in C this would take you to the header.
    -- map("<leader>gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
    {
      '<leader>gD',
      vim.lsp.buf.declaration,
      mode = 'n',
      desc = '[G]oto [D]eclaration',
    },

    -- Fuzzy find all the symbols in your current document.
    --  Symbols are things like variables, functions, types, etc.
    -- map("<leader>fd", require("fzf-lua").lsp_document_symbols, "[F]ind [D]ocument Symbols")
    {
      '<leader>fd',
      require('fzf-lua').lsp_document_symbols,
      mode = 'n',
      desc = '[F]ind [D]ocument Symbols',
    },

    -- Fuzzy find all the symbols in your current workspace.
    --  Similar to document symbols, except searches over your entire project.
    -- map("<leader>fs", require("fzf-lua").lsp_live_workspace_symbols, "[F]ind [W]orkspace Symbols")
    {
      '<leader>fs',
      require('fzf-lua').lsp_live_workspace_symbols,
      mode = 'n',
      desc = '[F]ind [W]orkspace Symbols',
    },

    -- Jump to the type of the word under your cursor.
    --  Useful when you're not sure what type a variable is and you want to see
    --  the definition of its *type*, not where it was *defined*.
    -- map("<leader>gt", require("fzf-lua").lsp_typedefs, "[G]oto [T]ype Definition")
    {
      '<leader>gt',
      require('fzf-lua').lsp_typedefs,
      mode = 'n',
      desc = '[G]oto [T]ype Definition',
    },
    {
      'K',
      function()
        vim.lsp.buf.hover { border = 'single', max_height = 25, max_width = 120 }
      end,
      desc = 'Hover documentation',
    },
  },
  config = function()
    vim.lsp.config('*', {
      capabilities = vim.lsp.protocol.make_client_capabilities(),
    })

    require('mason').setup()
    require('mason-lspconfig').setup {
      ensure_installed = { 'rust_analyzer', 'lua_ls' },
    }
  end,
}
