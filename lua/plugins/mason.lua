return {
  "williamboman/mason.nvim",
  config = function(name, info)
  require("mason").setup {
    ui = {
      border = "rounded",
    },
    github = {
      download_url_template = "https://ghproxy.com/github.com/%s/releases/download/%s/%s",
    },
  }
end
}
