return {
  {
    "stevearc/oil.nvim",
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    lazy = false,
    opts = {
      default_file_explorer = true,
      columns = {
        "icon",
      },
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
        natural_order = true,
        is_always_hidden = function(name, _)
          return name == ".git"
        end,
      },
    },
    keys = {
      { "-", "<cmd>Oil<cr>", { desc = "Open parent directory" } },
    },
  },
}
