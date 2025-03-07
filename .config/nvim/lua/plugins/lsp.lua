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
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
      { "WhoIsSethDaniel/mason-tool-installer.nvim" },
    },
    init = function()
      vim.o.signcolumn = "yes"
    end,
    config = function()
      -- diagnostics icons
      vim.diagnostic.config({
        severity_sort = true,
        float = { border = "rounded", source = "if_many" },
        underline = { severity = vim.diagnostic.severity.ERROR },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
          },
        },
        virtual_text = {
          source = "if_many",
          spacing = 2,
          format = function(diagnostic)
            local diagnostic_message = {
              [vim.diagnostic.severity.ERROR] = diagnostic.message,
              [vim.diagnostic.severity.WARN] = diagnostic.message,
              [vim.diagnostic.severity.INFO] = diagnostic.message,
              [vim.diagnostic.severity.HINT] = diagnostic.message,
            }
            return diagnostic_message[diagnostic.severity]
          end,
        },
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP actions",
        callback = function(event)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = event.buf, desc = "Hover" })
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = event.buf, desc = "Rename Symbol" })
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = event.buf, desc = "Code Action" })
          vim.keymap.set("n", "<leader>tD", vim.diagnostic.open_float, { buffer = event.buf, desc = "Diagnostics Hover" })
          vim.keymap.set("n", "<leader>ti", function()
            vim.diagnostic.enable(not vim.diagnostic.is_enabled())
          end, { buffer = event.buf, noremap = true, desc = "Inline diagnostics" })
        end,
      })

      require("mason-lspconfig").setup({
        -- not using ts_ls here because we use typescript-tools
        ensure_installed = { "lua_ls" },
        automatic_installation = true,
        handlers = {
          -- automatically setup all installed language servers
          function(server_name)
            require("lspconfig")[server_name].setup({})
          end,
        },
      })
      require("mason-tool-installer").setup({
        ensure_installed = {
          "prettierd",
          "eslint_d",
          "stylua",
        },
        automatic_installation = true,
        auto_update = true,
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
