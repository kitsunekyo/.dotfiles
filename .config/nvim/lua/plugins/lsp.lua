if vim.g.vscode then
  return {}
end

return {
  {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "LspInfo", "LspInstall", "LspUninstall" },
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
      "saghen/blink.cmp",
    },
    config = function()
      -- diagnostics
      vim.diagnostic.config({
        severity_sort = true,
        -- underline = { severity = vim.diagnostic.severity.ERROR },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "󰅚",
            [vim.diagnostic.severity.WARN] = "󰀪",
            [vim.diagnostic.severity.INFO] = "󰋽",
            [vim.diagnostic.severity.HINT] = "󰌶",
          },
        },
        virtual_text = {
          severity = { min = vim.diagnostic.severity.WARN },
        },
      })

      -- lsp manager
      require("mason").setup({
        ui = { icons = { package_installed = "✓", package_pending = "➜", package_uninstalled = "✗" } },
      })

      -- automatically enables installed lsps
      require("mason-lspconfig").setup({ ensure_installed = { "lua_ls", "eslint", "vtsls", "jsonls" } })

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace",
            },
            diagnostics = { disable = { "missing-fields" } },
          },
        },
      })

      vim.lsp.config("eslint", {
        settings = {
          codeAction = {
            showDocumentation = {
              enable = false,
            },
          },
          format = false,
          problems = {
            shortenToSingleLine = true,
          },
        },
      })

      -- unused
      vim.lsp.config("ts_ls", {
        settings = {
          typescript = {
            preferGoToSourceDefinition = true,
            preferences = {
              preferTypeOnlyAutoImports = true,
            },
          },
        },
      })

      vim.lsp.config("vtsls", {
        settings = {
          typescript = {
            preferences = {
              preferTypeOnlyAutoImports = true,
            },
          },
        },
      })

      vim.lsp.config("jsonls", {
        settings = {
          json = {
            format = {
              enable = false,
            },
            schemas = {
              {
                fileMatch = { "package.json" },
                url = "https://json.schemastore.org/package.json",
              },
              {
                fileMatch = { "tsconfig*.json" },
                url = "https://json.schemastore.org/tsconfig.json",
              },
              {
                fileMatch = {
                  ".prettierrc",
                  ".prettierrc.json",
                  "prettier.config.json",
                },
                url = "https://json.schemastore.org/prettierrc.json",
              },
              {
                fileMatch = { ".eslintrc", ".eslintrc.json" },
                url = "https://json.schemastore.org/eslintrc.json",
              },
              {
                fileMatch = { ".babelrc", ".babelrc.json", "babel.config.json" },
                url = "https://json.schemastore.org/babelrc.json",
              },
              {
                fileMatch = { "lerna.json" },
                url = "https://json.schemastore.org/lerna.json",
              },
              {
                fileMatch = { "now.json", "vercel.json" },
                url = "https://json.schemastore.org/now.json",
              },
              {
                fileMatch = {
                  ".stylelintrc",
                  ".stylelintrc.json",
                  "stylelint.config.json",
                },
                url = "http://json.schemastore.org/stylelintrc.json",
              },
            },
          },
        },
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "setup lsp keybinds",
        callback = function(event)
          local function map(keys, cb, desc)
            vim.keymap.set("n", keys, cb, { buffer = event.buf, noremap = true, desc = desc or "" })
          end

          -- lsp-defaults
          -- - "grn" is mapped in Normal mode to |vim.lsp.buf.rename()|
          -- - "gra" is mapped in Normal and Visual mode to |vim.lsp.buf.code_action()|
          -- - "grr" is mapped in Normal mode to |vim.lsp.buf.references()|
          -- - "gri" is mapped in Normal mode to |vim.lsp.buf.implementation()|
          -- - "gO" is mapped in Normal mode to |vim.lsp.buf.document_symbol()|
          -- - CTRL-S is mapped in Insert mode to |vim.lsp.buf.signature_help()|

          -- stylua: ignore start
          map("<leader>tz", function() vim.diagnostic.enable(not vim.diagnostic.is_enabled()) end, "Inline diagnostics (zen-mode)")
          map("üd", function() vim.diagnostic.jump({ count=-1, float=true }) end, "Previous diagnostic")
          map("]d", function() vim.diagnostic.jump({ count=1, float=true }) end, "Next diagnostic")
          -- stylua: ignore end
        end,
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "use lsp folding",
        callback = function(event)
          local client = assert(vim.lsp.get_client_by_id(event.data.client_id))

          if not client:supports_method("textDocument/foldingRange") then
            return
          end

          local win = vim.api.nvim_get_current_win()
          vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
        end,
      })
    end,
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        { path = "snacks.nvim", words = { "Snacks" } },
        { path = "lazy.nvim", words = { "LazyVim" } },
      },
    },
  },
  {
    "davidmh/mdx.nvim",
    ft = "markdown",
    config = true,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
}
