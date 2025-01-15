return {
  {
    'echasnovski/mini.nvim',
    config = function()
      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = true }

      require("mini.ai").setup()
      require("mini.comment").setup()
      require("mini.indentscope").setup {
        symbol = '',
      }
    end
  }
}
