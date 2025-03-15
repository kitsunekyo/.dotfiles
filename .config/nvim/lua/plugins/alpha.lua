-- startup dashboard
return {
  "goolord/alpha-nvim",
  -- enabled = vim.g.vscode == nil,
  enabled = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  priority = 1000,
  config = function()
    local startify = require("alpha.themes.startify")
    startify.file_icons.provider = "devicons"
    require("alpha").setup(startify.config)
  end,
}
