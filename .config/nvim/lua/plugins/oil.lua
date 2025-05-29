return {
  {
    "stevearc/oil.nvim",
    enabled = true,
    lazy = false,
    opts = {
      default_file_explorer = true,
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
        is_always_hidden = function(name, _)
          return name == ".git"
        end,
      },
      win_options = {
        wrap = true,
      },
      keymaps = {
        ["'"] = { "actions.cd", mode = "n", desc = "cd here" },
        ["gr"] = { "actions.refresh", mode = "n", desc = "Refresh" },
        ["gS"] = { "actions.change_sort", mode = "n" },
        ["gs"] = { "actions.select", opts = { vertical = true }, desc = "Open in vertical split" },
        ["gv"] = { "actions.select", opts = { horizontal = true }, desc = "Open in horizontal split" },
        ["<C-l>"] = false,
        ["<C-h>"] = false,
        ["<C-t>"] = false,
      },
    },
    keys = {
      { "-", "<cmd>Oil<cr>", { desc = "Open file explorer" } },
    },
  },
}
