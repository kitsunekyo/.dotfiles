return {
  {
    "LunarVim/breadcrumbs.nvim",
    enabled = false,
    dependencies = {
      "SmiteshP/nvim-navic",
    },
    config = function()
      require("nvim-navic").setup({
        lsp = {
          auto_attach = true,
        },
      })
      require("breadcrumbs").setup()
    end,
  },
}
