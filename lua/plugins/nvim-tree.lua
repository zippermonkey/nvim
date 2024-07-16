return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  keys = {
    { "<leader>te", "<cmd>NvimTreeToggle<cr>", mode = "n", desc = "[t]oggle tr[e]e" }
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {}
}
