return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = { "rafamadriz/friendly-snippets" },
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = { preset = "default", ["<C-f>"] = { "accept" } },
      completion = {
        menu = {
          draw = {
            columns = {
              { "kind_icon", "label", gap = 1 },
              { "label_description" },
            },
          },
        },
      },
      appearance = {
        nerd_font_variant = "mono",
      },
    },
  },
}
