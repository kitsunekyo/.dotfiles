return {
  {
    "rcarriga/nvim-notify",
    config = function()
      local notify = require("notify")
      notify.setup({
        render = "compact",
        stages = "fade",
        timeout = 3000,
      })
      vim.notify = notify
    end,
  },
  {
    "j-hui/fidget.nvim",
    opts = {},
  },
}
