return {
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      { "<leader>tD", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Toggle buffer diagnostics" },
      { "<leader>tQ", "<cmd>Trouble qflist toggle<cr>", desc = "Toggle QuickFixList" },
    },
  },
}
