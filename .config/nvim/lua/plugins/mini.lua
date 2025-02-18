return {
  {
    "echasnovski/mini.nvim",
    config = function()
      -- mini.surround default keybinds
      -- - saiw)        - [S]urround [A]dd [I]nner [W]ord with [)]Paren
      -- - sd'          - [S]urround [D]elete [']
      -- - sr'"         - [S]urround [R]eplace ['] with ["]
      require("mini.surround").setup({})
      require("mini.ai").setup({ n_lines = 500 })
      require("mini.comment").setup({})
      require("mini.basics").setup({
        options = {
          win_borders = "rounded",
        },
        mappings = {
          windows = true,
        },
        autocommands = {
          basic = true,
        },
      })

      -- below plugins should not be loaded when using vscode-neovim
      if vim.g.vscode then
        return nil
      end

      local statusline = require("mini.statusline")
      statusline.setup({ use_icons = vim.g.have_nerd_font })

      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return "%2l:%-2v"
      end
    end,
  },
}
