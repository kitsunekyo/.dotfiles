return {
  {
    "echasnovski/mini.nvim",
    config = function()
      -- mini.surround default keybinds
      -- - saiw)        - [S]urround [A]dd + motion = [I]nner [W]ord with [)]Paren
      -- - sd'          - [S]urround [D]elete [']
      -- - sr'"         - [S]urround [R]eplace ['] with ["]
      require("mini.surround").setup({
        respect_selection_type = true,
      })
      require("mini.ai").setup({ n_lines = 500 })
      require("mini.comment").setup()

      if vim.g.vscode then
        return nil
      end

      local miniFiles = require("mini.files")
      miniFiles.setup({
        mappings = {
          go_out_plus = "h",
          go_out = "H",
          go_in_plus = "l",
          go_in = "L",
          synchronize = "w",
        },
        options = {
          use_as_default_explorer = true,
        },
      })

      vim.keymap.set("n", "-", miniFiles.open, { desc = "Open explorer" })

      vim.api.nvim_create_autocmd("User", {
        desc = "mini.files relativenumber",
        pattern = "MiniFilesWindowUpdate",
        callback = function(args)
          vim.wo[args.data.win_id].relativenumber = true
        end,
      })

      local statusline = require("mini.statusline")

      statusline.setup({
        use_icons = vim.g.have_nerd_font,
        content = {
          active = function()
            local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
            local diagnostics = statusline.section_diagnostics({ trunc_width = 75 })
            local lsp = statusline.section_lsp({ trunc_width = 75 })
            local filename = statusline.section_filename({ trunc_width = 140 })
            -- local fileinfo = statusline.section_fileinfo({ trunc_width = 120 })
            local location = "%l│%2v"
            local search = statusline.section_searchcount({ trunc_width = 75 })

            return statusline.combine_groups({
              { hl = mode_hl, strings = { mode } },
              { hl = "MiniStatuslineDevinfo", strings = { diagnostics, lsp } },
              "%<", -- Mark general truncate point
              { hl = "MiniStatuslineFilename", strings = { filename } },
              "%=", -- End left alignment
              -- { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
              { hl = mode_hl, strings = { search, location } },
            })
          end,
        },
      })
    end,
  },
}
