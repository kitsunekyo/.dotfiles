return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      explorer = {},
      dashboard = {
        sections = {
          { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
          { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          { section = "startup" },
        },
      },
      bigfile = {},
      input = {},
      picker = {
        hidden = true,
        layout = {
          preset = "select",
        },
        formatters = {
          file = {
            filename_first = true,
            truncate = 120,
          },
        },
        win = {
          input = {
            keys = {
              ["⁄"] = { "toggle_ignored", mode = { "i", "n" } },
              ["ª"] = { "toggle_hidden", mode = { "i", "n" } },
              ["π"] = { "toggle_preview", mode = { "i", "n" } },
              ["µ"] = { "toggle_maximize", mode = { "i", "n" } },
            },
          },
        },
      },
      notifier = {},
      notify = {},
      scope = {},
      scroll = {},
      quickfile = {},
      terminal = {},
    },
    -- stylua: ignore start
    keys = {
      -- [F]ind
      { "<leader>ff", function() Snacks.picker.files({ hidden = true }) end, desc = "Find files", },
      { "<leader>fs", function() Snacks.picker.smart() end, desc = "Smart find files", },
      { "<leader>fr", function() Snacks.picker.recent() end, desc = "Find recent files", },
      { "<leader>f.", function() Snacks.picker.files({ cwd = "$HOME/.dotfiles" }) end, desc = "Find in .dotfiles", },
      { "<leadel>fB", function() Snacks.picker.lines() end, desc = "Buffer Lines", },
      { "<leader>fu", function() Snacks.picker.undo() end, desc = "Find in undo history", },

      -- [S]earch
      { "<leader>sg", function() Snacks.picker.grep() end, desc = "Search grep", },
      { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "Search Symbols (LSP)", },
      { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "Search Workspace Symbols (LSP)", },

      -- [T]oggle
      { "<leader>tn", function() Snacks.notifier.show_history() end, desc = "Toggle notification history", },
      { "<leader>te", function() Snacks.picker.explorer({ hidden = true, layout = { layout = { position = 'right', } } }) end, desc = "Toggle file explorer", },
      { "<leader>tt", function() Snacks.terminal.toggle() end, desc = "Toggle Terminal", },

      -- [B]uffers
      { "<leader>bb", function() Snacks.picker.buffers() end, desc = "Find buffer", },
      { "<leader>bd", function() Snacks.bufdelete() end, desc = "Close buffer", },
      { "<leader>bQ", function() Snacks.bufdelete.all() end, desc = "Close all buffers", },

      -- [H]unk / git
      { "<leader>hB", function() Snacks.picker.git_branches() end, desc = "Git Branches", },
      { "<leader>hl", function() Snacks.picker.git_log() end, desc = "Git Log", },

      -- LSP stuff
      -- default mappings but with Snacks
      { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition", },
      { "grr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References", },
      { "gri", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation", },
    },
    -- stylua: ignore end
  },
}
