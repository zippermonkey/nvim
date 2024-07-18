return {
  'neovim/nvim-lspconfig',

  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'ray-x/lsp_signature.nvim',
    'hrsh7th/cmp-nvim-lsp',
    'folke/neoconf.nvim',
    'folke/neodev.nvim',
  },

  after = {
    'mason.nvim',
  },

  lazy = false,

  keys = {
    { '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<cr>', mode = 'n', desc = '[g]oto [d]efinitions' },
    { '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', mode = 'n', desc = '[g]oto [D]eclarations' },
    { '<leader>gr', '<cmd>lua vim.lsp.buf.references()<cr>', mode = 'n', desc = '[g]oto [r]eferences' },
    -- {
    --   '<leader>fl',
    --   function()
    --     vim.lsp.buf.format { async = true }
    --   end,
    --   mode = 'n',
    --   desc = 'lsp [f]orma[t]',
    -- },
  },

  config = function()
    local default_config = {
      capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
      on_attach = function(client, bufnr)
        if client.server_capabilities.signatureHelpProvider then
          require('lsp_signature').on_attach(client, bufnr)
        end
      end,
    }

    for _, config in pairs(require 'lspconfig.configs') do
      config.manager = nil
    end

    require('neoconf').setup {
      plugins = {
        lspconfig = {
          enabled = true,
        },
        jsonls = {
          enabled = true,
        },
        lua_ls = {
          enabled = false,
          enabled_for_neovim_config = true,
        },
      },
    }

    -- for lua
    require('neodev').setup {
      library = {
        enabled = true,
        runtime = true,
        types = true,
        plugins = true,
      },
      setup_jsonls = true,
    }

    local mason_lspconfig = require 'mason-lspconfig'
    mason_lspconfig.setup {
      ensure_installed = { 'lua_ls' },
      automatic_installation = true,
    }

    -- other server installed with mason.
    local lspconfig = require 'lspconfig'
    for _, server_name in ipairs(mason_lspconfig.get_installed_servers()) do
      if lspconfig[server_name].manager == nil then
        lspconfig[server_name].setup(default_config)
      end
    end
  end,
}
