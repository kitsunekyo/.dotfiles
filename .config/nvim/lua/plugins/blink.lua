return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = { "rafamadriz/friendly-snippets" },
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = { preset = "default", ["<C-f>"] = { "accept" }, ["<CR>"] = { "accept", "fallback" } },
      cmdline = { enabled = false },
    },
  },
}
