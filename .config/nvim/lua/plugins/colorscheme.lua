return {
  {
    -- "catppuccin/nvim",
    -- "folke/tokyonight.nvim",
    -- "projekt0n/github-nvim-theme",
    "olimorris/onedarkpro.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      --  vim.cmd.colorscheme("tokyonight-storm")
      --  vim.cmd.colorscheme("catppuccin-mocha")
      --  vim.cmd.colorscheme("github_dark")
      vim.cmd.colorscheme("onedark")
    end,
  },
}
