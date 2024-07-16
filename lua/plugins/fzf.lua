return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>ff", "<cmd>FzfLua files<cr>",   mode = "n", desc = "[f]ind [f]iles" },
    { "<leader>fb", "<cmd>FzfLua buffers<cr>", mode = "n", desc = "[f]ind [b]uffers" },
    { "<leader>fo", "<cmd>FzfLua oldfiles<cr>", mode = "n", desc = "[f]ind [o]ldfiles" },
    { "<leader>fg", "<cmd>FzfLua live_grep<cr>", mode = "n", desc = "[f]ind somethinf with live [g]rep" },
  },
  config = function()
    -- calling `setup` is optional for customization
    require("fzf-lua").setup({
      winopts = {
        split = "botright new" -- open in a full-width split on the bottom
      }
    })
  end
}
