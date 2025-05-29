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
        ["'"] = { "actions.cd", mode = "n", desc = "Set cwd" },
      },
    },
    keys = {
      { "-", "<cmd>Oil<cr>", { desc = "Open file explorer" } },
    },
  },
}
