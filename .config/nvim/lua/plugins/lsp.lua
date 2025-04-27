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
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "saghen/blink.cmp",
    },
    config = function()
      ---@type vim.lsp.config
      local servers = {
        eslint = {
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
        },
        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = "Replace",
              },
              diagnostics = { disable = { "missing-fields" } },
            },
          },
        },
        vtsls = {},
      }

      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        "stylua",
        "prettierd",
        "eslint",
        "lua_ls",
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      require("mason").setup()
      require("mason-tool-installer").setup({ ensure_installed = ensure_installed, auto_update = true })
      require("mason-lspconfig").setup({
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
            require("lspconfig")[server_name].setup(server)
          end,
        },
      })

      -- diagnostics
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
        desc = "diagnostics keymaps",
        callback = function(event)
          local function map(keys, cb, desc)
            vim.keymap.set("n", keys, cb, { buffer = event.buf, noremap = true, desc = desc or "" })
          end
          local client = vim.lsp.get_client_by_id(event.data.client_id)

          -- stylua: ignore start
          map("<leader>td", function() vim.diagnostic.enable(not vim.diagnostic.is_enabled()) end, "Inline diagnostics")
          map("üd", function() vim.diagnostic.goto_prev({ count=-1, float=true, wrap=true }) end, "Previous diagnostic")
          map("+d", function() vim.diagnostic.goto_next({ count=1, float=true, wrap=true }) end, "Next diagnostic")
          -- stylua: ignore end

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
        end,
      })
    end,
  },
  {
    "pmizio/typescript-tools.nvim",
    enabled = false,
    ft = { "typescript", "typescriptreact" },
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
      settings = {
        expose_as_code_action = { "fix_all", "add_missing_imports", "remove_unused" },
      },
    },
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
