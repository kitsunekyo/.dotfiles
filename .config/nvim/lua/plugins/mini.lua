return {
  {
    "echasnovski/mini.nvim",
    config = function()
      require("mini.ai").setup({ n_lines = 500 })
      require("mini.comment").setup({})
      require("mini.basics").setup({
        mappings = {
          windows = true,
        },
      })
      -- mini.surround keybinds
      -- - saiw)        - [S]urround [A]dd [I]nner [W]ord with [)]Paren
      -- - sd'          - [S]urround [D]elete [']
      -- - sr'"         - [S]urround [R]eplace ['] with ["]
      require("mini.surround").setup({})

      if vim.g.vscode then
        return nil
      end
      -- below plugins should not be loaded when using vscode-neovim

      require("mini.indentscope").setup({ symbol = "" })

      local get_active_statusline = function()
        local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
        local git = MiniStatusline.section_git({ trunc_width = 40 })
        local diff = nil -- MiniStatusline.section_diff({ trunc_width = 75 })
        local diagnostics = nil -- MiniStatusline.section_diagnostics({ trunc_width = 75 })
        local lsp = MiniStatusline.section_lsp({ trunc_width = 75 })
        local filename = MiniStatusline.section_filename({ trunc_width = 140 })
        local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
        local location = nil -- MiniStatusline.section_location({ trunc_width = 75 })
        local search = MiniStatusline.section_searchcount({ trunc_width = 75 })

        return MiniStatusline.combine_groups({
          { hl = mode_hl, strings = { mode } },
          { hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics, lsp } },
          "%<", -- Mark general truncate point
          { hl = "MiniStatuslineFilename", strings = { filename } },
          "%=", -- End left alignment
          { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
          { hl = mode_hl, strings = { search, location } },
        })
      end

      require("mini.statusline").setup({
        use_icons = vim.g.have_nerd_font,
        content = {
          active = get_active_statusline,
        },
      })
    end,
  },
}
