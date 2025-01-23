return {
  {
    "echasnovski/mini.nvim",
    config = function()
      require("mini.statusline").setup({ use_icons = true })
      require("mini.ai").setup({ n_lines = 500 })
      require("mini.comment").setup()
      require("mini.indentscope").setup({ symbol = "" })
      require("mini.basics").setup({
        mappings = {
          windows = true,
        },
      })
      -- - saiw)        - [S]urround [A]dd [I]nner [W]ord with [)]Paren
      -- - sd'          - [S]urround [D]elete [']
      -- - sr'"         - [S]urround [R]eplace ['] with ["]
      require("mini.surround").setup()
    end,
  },
}
