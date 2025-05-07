if vim.g.vscode then
  return {}
end

return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "LspInfo", "LspInstall", "LspUninstall" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "saghen/blink.cmp",
    },
    config = function()
      -- lsp manager
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })

      -- automatically enables installed lsps
      require("mason-lspconfig").setup({ ensure_installed = {
        "lua_ls",
        "ts_ls",
        "eslint",
      } })

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
        },
        on_attach = function(_, buffer)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = buffer,
            command = "EslintFixAll",
          })
        end,
      })

      vim.diagnostic.config({
        severity_sort = true,
        -- float = { border = "rounded", source = "if_many" },
        -- underline = { severity = vim.diagnostic.severity.ERROR },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "󰅚",
            [vim.diagnostic.severity.WARN] = "󰀪",
            [vim.diagnostic.severity.INFO] = "󰋽",
            [vim.diagnostic.severity.HINT] = "󰌶",
          },
        },
        virtual_text = true,
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "configure lsp features",
        callback = function(event)
          local function map(keys, cb, desc)
            vim.keymap.set("n", keys, cb, { buffer = event.buf, noremap = true, desc = desc or "" })
          end

          -- stylua: ignore start
          -- lsp-defaults
          -- - "grn" is mapped in Normal mode to |vim.lsp.buf.rename()|
          -- - "gra" is mapped in Normal and Visual mode to |vim.lsp.buf.code_action()|
          -- - "grr" is mapped in Normal mode to |vim.lsp.buf.references()|
          -- - "gri" is mapped in Normal mode to |vim.lsp.buf.implementation()|
          -- - "gO" is mapped in Normal mode to |vim.lsp.buf.document_symbol()|
          map("<leader>tD", function() vim.diagnostic.enable(not vim.diagnostic.is_enabled()) end, "Inline diagnostics")
          map("üd", function() vim.diagnostic.jump({ count=-1, float=true, wrap=true }) end, "Previous diagnostic")
          map("+d", function() vim.diagnostic.jump({ count=1, float=true, wrap=true }) end, "Next diagnostic")
          map("<C-k>", vim.lsp.buf.signature_help, "Show signature_help")
          -- stylua: ignore end

          local client = assert(vim.lsp.get_client_by_id(event.data.client_id))

          if client:supports_method("textDocument/documentHighlight") then
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              desc = "Highlight",
              callback = function(_)
                vim.lsp.buf.document_highlight()
              end,
            })

            vim.api.nvim_create_autocmd("CursorMoved", {
              desc = "Remove Highlight",
              callback = function(_)
                vim.lsp.buf.clear_references()
              end,
            })
          end

          if client:supports_method("textDocument/foldingRange") then
            local win = vim.api.nvim_get_current_win()
            vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
          end
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
}
