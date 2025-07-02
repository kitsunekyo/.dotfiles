return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    ---@type snacks.Config
    opts = {
      bigfile = {},
      input = {},
      layout = {},
      picker = {
        hidden = true,
        matcher = {
          cwd_bonus = true,
          frecency = true,
        },
        layout = {
          preset = "ivy",
        },
        formatters = {
          file = {
            filename_first = true,
            -- truncate = vim.api.nvim_win_get_width(0) * 0.8,
            -- truncate = 120,
          },
        },
        win = {
          input = {
            keys = {
              ["⁄"] = { "toggle_ignored", mode = { "i", "n" } }, -- alt+i
              ["ª"] = { "toggle_hidden", mode = { "i", "n" } }, -- alt+h
              ["π"] = { "toggle_preview", mode = { "i", "n" } }, -- alt+p
              ["µ"] = { "toggle_maximize", mode = { "i", "n" } }, -- alt+m
              -- ctrl-q put results into quickfix
              -- ctrl-g toggle livegrep
            },
          },
        },
      },
      scroll = {},
      notifier = {},
      quickfile = {},
    },
    keys = {
      -- stylua: ignore start
      -- [F]ind
      { "<leader>ff", function() Snacks.picker.files({ hidden = true, layout = "vscode" }) end, desc = "Find files", },
      { "<leader>fs", function() Snacks.picker.smart({ hidden = true, layout = "vscode" }) end, desc = "Smart find files", },
      { "<leader>fr", function() Snacks.picker.recent({ hidden = true, layout = "vscode" }) end, desc = "Find recent files", },
      { "<leader>fB", function() Snacks.picker.lines() end, desc = "Buffer Lines", },
      { "<leader>fu", function() Snacks.picker.undo() end, desc = "Find in undo history", },

      -- [S]earch
      { "<leader>sp", function() Snacks.picker() end, desc = "Search pickers", },
      { "<leader>sg", function() Snacks.picker.grep() end, desc = "Search grep", },
      { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "Search Symbols (LSP)", },
      { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "Search Workspace Symbols (LSP)", },

      -- [T]oggle
      { "<leader>tn", function() Snacks.notifier.show_history() end, desc = "Toggle notification history", },

      -- [B]uffers
      { "<leader>bb", function() Snacks.picker.buffers({ unloaded = false }) end, desc = "Find buffer", },
      { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete buffer", },
      { "<leader>bQ", function() Snacks.bufdelete.all() end, desc = "Close all buffers", },

      -- [H]unk / git
      { "<leader>hB", function() Snacks.picker.git_branches() end, desc = "Git Branches", },
      { "<leader>hl", function() Snacks.picker.git_log() end, desc = "Git Log", },

      -- LSP stuff
      -- default mappings but with Snacks
      { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition", },
      { "grr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References", },
      { "gri", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation", },
      -- stylua: ignore end
    },
  },
}
