return {
  {
    'echasnovski/mini.nvim',
    config = function()
      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = true }

      require("mini.ai").setup()
      require("mini.basics").setup()
      require("mini.comment").setup()
      require("mini.jump").setup()
    end
  }
}
