return {
  "goolord/alpha-nvim",
  enabled = vim.g.vscode == nil,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local startify = require("alpha.themes.startify")
    startify.file_icons.provider = "devicons"
    require("alpha").setup(startify.config)
  end,
}
