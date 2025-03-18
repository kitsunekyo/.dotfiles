if vim.g.vscode then
  return {}
end

return {
  {
    "saghen/blink.cmp",
    version = "*",
    dependencies = "rafamadriz/friendly-snippets",
    opts = {
      keymap = { preset = "default", ["<C-f>"] = { "accept" }, ["<CR>"] = { "accept", "fallback" } },
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
  -- lsp config
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim", opts = {} },
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      { "j-hui/fidget.nvim", opts = {} },
      { "saghen/blink.cmp" },
    },
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
        group = vim.api.nvim_create_augroup("augroup-lsp-attach", { clear = true }),
        callback = function(event)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = event.buf, desc = "Hover" })
          -- disabled in favor of inc-rename.nvim
          -- vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = event.buf, desc = "Rename Symbol" })
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = event.buf, desc = "Code Action" })
          vim.keymap.set("n", "<leader>tD", function()
            vim.diagnostic.open_float(nil, { focus = false })
          end, { buffer = event.buf, desc = "Diagnostics Hover" })
          vim.keymap.set("n", "<leader>ti", function()
            vim.diagnostic.enable(not vim.diagnostic.is_enabled())
          end, { buffer = event.buf, noremap = true, desc = "Inline diagnostics" })

          -- diagnostics float on CursorHold
          vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
          -- vim.cmd([[autocmd! ColorScheme * highlight NormalFloat guigb=#1f2335 guifg=#abb2bf]])
        end,
      })

      local servers = {
        lua_ls = {},
        ts_ls = {},
      }

      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        "stylua",
        "prettier",
        "eslint_d",
      })

      require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
      require("mason-lspconfig").setup({
        ensure_installed = {},
        automatic_installation = false,
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = require("blink.cmp").get_lsp_capabilities(server.capabilities or {})
            require("lspconfig")[server_name].setup(server)
          end,
        },
      })
    end,
  },
}
