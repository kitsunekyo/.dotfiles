return {
  -- LSP
  { "williamboman/mason.nvim", opts = {} },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup()
      require("mason-lspconfig").setup_handlers({
        function(server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup({})
        end,
      })
    end,
  },
  -- formatter
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          javascript = { "prettierd", "prettier", stop_after_first = true },
          typescript = { "prettierd", "prettier", stop_after_first = true },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_format = "fallback",
        },
      })
    end,
  },
  { "zapling/mason-conform.nvim", opts = {} },
  -- linter
  {
    "mfussenegger/nvim-lint",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("lint").linters_by_ft = {
        markdown = { "vale" },
        javascript = { "eslint_d" },
      }
    end,
  },
  {
    "rshkarin/mason-nvim-lint",
    dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-lint" },
    config = function()
      require("mason-nvim-lint").setup({
        ensure_installed = {},
        ignore_install = {},
        automatic_installation = false,
        quiet_mode = false,
      })
    end,
  },
}
