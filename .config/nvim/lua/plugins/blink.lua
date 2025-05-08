return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = { "rafamadriz/friendly-snippets" },
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = { preset = "super-tab", ["<C-f>"] = { "accept", "fallback" } },
      completion = {
        menu = {
          draw = {
            columns = { { "kind_icon", "label", gap = 1 }, { "label_description" } },
          },
        },
        documentation = {
          auto_show = true,
        },
      },
      signature = { enabled = true },
      appearance = {
        nerd_font_variant = "mono",
        use_nvim_cmp_as_default = true,
      },
    },
  },
}
