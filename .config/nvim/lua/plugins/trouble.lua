return {
  {
    "folke/trouble.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      auto_close = true,
      max_items = 10,
    },
    cmd = "Trouble",
    keys = {
      { "<leader>tD", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Diagnostics" },
      { "<leader>tQ", "<cmd>Trouble qflist toggle<cr>", desc = "QuickFixList" },
    },
  },
}
