if vim.g.vscode then
  return {}
end

return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    opts = {},
  },
  {
    "saghen/blink.cmp",
    version = "*",
    dependencies = "rafamadriz/friendly-snippets",
    opts = {
      keymap = { preset = "default", ["<C-f>"] = { "accept" } },
      appearance = {
        nerd_font_variant = "mono",
      },
      sources = {
        default = { "lsp", "path", "buffer" },
      },
      cmdline = {
        enabled = false,
      },
    },
    opts_extend = { "sources.default" },
  },
  -- nvim globals
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  -- lsp
  {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    dependencies = {
      -- { "hrsh7th/cmp-nvim-lsp" },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
    },
    init = function()
      vim.o.signcolumn = "yes"
    end,
    config = function()
      local lsp_defaults = require("lspconfig").util.default_config

      -- add cmp_nvim_lsp capabilities settings to lspconfig
      -- lsp_defaults.capabilities =
      --   vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

      -- enable features that require an lsp
      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP actions",
        callback = function(event)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = event.buf, desc = "Hover" })
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = event.buf, desc = "Rename Symbol" })
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = event.buf, desc = "Code Action" })
          vim.keymap.set(
            "n",
            "<leader>tD",
            vim.diagnostic.open_float,
            { buffer = event.buf, desc = "Diagnostics Hover" }
          )
          vim.keymap.set("n", "<leader>ti", function()
            vim.diagnostic.enable(not vim.diagnostic.is_enabled())
          end, { buffer = event.buf, noremap = true, desc = "Inline diagnostics" })
        end,
      })

      require("mason-lspconfig").setup({
        ensure_installed = {},
        automatic_installation = true,
        handlers = {
          -- automatically setup all installed language servers
          function(server_name)
            require("lspconfig")[server_name].setup({})
          end,
        },
      })
    end,
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {},
  },
}
