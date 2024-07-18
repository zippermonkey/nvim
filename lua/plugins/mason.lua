return {
  "williamboman/mason.nvim",
  config = function(name, info)
    require("mason").setup {
      ui = {
        border = "rounded",
      },
    }
  end
}
