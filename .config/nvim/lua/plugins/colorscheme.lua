return {
  {
    "projekt0n/github-nvim-theme",
    config = function()
      require("github-theme").setup({})
      vim.cmd.colorscheme("github_dark")
    end,
  },
  -- {
  --   "folke/tokyonight.nvim",
  --   config = function()
  --     vim.cmd.colorscheme("tokyonight-storm")
  --   end,
  -- },
  -- {
  --   "catppuccin/nvim",
  --   lazy = false,
  --   name = "catppuccin",
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme("catppuccin-mocha")
  --   end,
  -- },
}
