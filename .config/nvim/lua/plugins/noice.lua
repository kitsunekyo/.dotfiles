return {
  {
    "folke/noice.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    event = "VeryLazy",
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
        },
      },
      presets = {
        long_message_to_split = true, -- long messages will be sent to a split
        lsp_doc_border = true, -- add a border to hover docs and signature help
        bottom_search = true,
      },
      cmdline = {
        view = "cmdline",
        format = {
          cmdline = { conceal = false, icon = false, pattern = "^:", lang = "vim" },
          search_down = { conceal = false, icon = false, kind = "search", pattern = "^/", lang = "regex" },
          search_up = { conceal = false, icon = false, kind = "search", pattern = "^%?", lang = "regex" },
          filter = { conceal = false, icon = false, pattern = "^:%s*!", lang = "bash" },
          lua = { conceal = false, icon = false, pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, lang = "lua" },
          help = { conceal = false, icon = false, pattern = "^:%s*he?l?p?%s+" },
          input = { conceal = false, icon = false, view = "cmdline_input" },
        },
      },
    },
  },
}
