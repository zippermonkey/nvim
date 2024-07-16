---@type PluginSpec
return {
  "neovim/nvim-lspconfig",


  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "ray-x/lsp_signature.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "folke/neoconf.nvim",
    "folke/neodev.nvim",
  },

  after = {
    "mason.nvim"
  },
  config = function()
    local default_config = {
      capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
      on_attach = function(client, bufnr)
        if client.server_capabilities.signatureHelpProvider then
          require("lsp_signature").on_attach(client, bufnr)
        end
      end,
    }

    for _, config in pairs(require("lspconfig.configs")) do
      config.manager = nil
    end

    require("neoconf").setup {
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
    require("neodev").setup {
      library = {
        enabled = true,
        runtime = true,
        types = true,
        plugins = true,
      },
      setup_jsonls = true,
    }

    local mason_lspconfig = require("mason-lspconfig")
    mason_lspconfig.setup {
      ensure_installed = { "lua_ls" },
      automatic_installation = true,
    }

    -- other server installed with mason.
    local lspconfig = require("lspconfig")
    for _, server_name in ipairs(mason_lspconfig.get_installed_servers()) do
      if lspconfig[server_name].manager == nil then
        lspconfig[server_name].setup(default_config)
      end
    end
    vim.api.nvim_create_autocmd('LspAttach', {
      desc = 'LSP actions',
      callback = function()
        local bufmap = function(mode, lhs, rhs)
          local opts = { buffer = true }
          vim.keymap.set(mode, lhs, rhs, opts)
        end

        -- Displays hover information about the symbol under the cursor
        bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')

        -- Jump to the definition
        bufmap('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<cr>')

        -- Jump to declaration
        bufmap('n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')

        -- Lists all the implementations for the symbol under the cursor
        bufmap('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')

        -- Jumps to the definition of the type symbol
        bufmap('n', '<leader>go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')

        -- Lists all the references
        bufmap('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<cr>')

        -- Displays a function's signature information
        bufmap('n', '<leader>gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')

        -- Renames all references to the symbol under the cursor
        bufmap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>')

        -- Show diagnostics in a floating window
        bufmap('n', '<leader>gl', '<cmd>lua vim.diagnostic.open_float()<cr>')

        -- Move to the previous diagnostic
        bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')

        -- Move to the next diagnostic
        bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
        bufmap('n', '<leader>ft', function()
          vim.lsp.buf.format { async = true }
        end)
      end
    })
  end
}
