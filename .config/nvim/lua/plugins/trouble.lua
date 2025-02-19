return {
  {
    "folke/trouble.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      auto_close = true,
      max_items = 10,
    }, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      { "<leader>td", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Toggle buffer diagnostics" },
      { "<leader>tQ", "<cmd>Trouble qflist toggle<cr>", desc = "Toggle QuickFixList" },
    },
  },
}
