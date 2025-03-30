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
      lazygit = {},
      scope = {},
      scroll = {},
      quickfile = {},
      terminal = {},
    },
    keys = {
      -- stylua: ignore start
      -- Main Pickers
      { "<leader><leader>", function() Snacks.picker.smart() end, desc = "Smart Find Files", },
      { "<leader>.", function() Snacks.picker.buffers() end, desc = "Buffers", },
      { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep", },
      { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History", },
      { "<leader>n", function() Snacks.notifier.show_history() end, desc = "Notification History", },
      { "<leader>e", function() Snacks.picker.explorer({
        hidden = true,
        layout = {
          layout = {
            position = 'right',
          },
        },
      }) end, desc = "File Explorer", },
      -- Find
      { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") or "$HOME" }) end, desc = "Find Config File", },
      { "<leader>ff", function() Snacks.picker.files({ hidden = true }) end, desc = "Find Files", },
      { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent", },
      -- git
      { "<leader>hB", function() Snacks.picker.git_branches() end, desc = "Git Branches", },
      { "<leader>hl", function() Snacks.picker.git_log() end, desc = "Git Log", },
      { "<leader>hh", function() Snacks.picker.git_status() end, desc = "Git Status", },
      -- Grep
      { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines", },
      { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers", },
      { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep", },
      -- Search
      { '<leader>s"', function() Snacks.picker.registers() end, desc = "Registers", },
      { "<leader>s/", function() Snacks.picker.search_history() end, desc = "Search History", },
      { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines", },
      { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics", },
      { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics", },
      { "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages", },
      { "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History", },
      { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols", },
      { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols", },
      { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition", },
      { "grr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References", },
      { "gri", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation", },
      -- Toggle
      { "<leader>tg", function() Snacks.lazygit() end, desc = "LazyGit", },
      { "<leader>tt", function() Snacks.terminal.toggle() end, desc = "Terminal", },
      -- Buffers
      { "<leader>bd", function() Snacks.bufdelete() end, desc = "Close buffer", },
      { "<leader>bQ", function() Snacks.bufdelete.all() end, desc = "Close all buffers", },
      -- stylua: ignore end
    },
  },
}
