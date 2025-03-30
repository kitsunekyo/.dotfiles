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
  -- lua globals
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
        virtual_lines = true,
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP actions",
        callback = function(event)
          local function map(keys, cb, desc)
            vim.keymap.set("n", keys, cb, { buffer = event.buf, noremap = true, desc = desc or "" })
          end
          local client = vim.lsp.get_client_by_id(event.data.client_id)

          -- stylua: ignore start
          map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
          map("<leader>td", function() vim.diagnostic.enable(not vim.diagnostic.is_enabled()) end, "Inline diagnostics")

          vim.keymap.set("n", "üd", function() vim.diagnostic.jump({ count=-1, float=true, wrap=true }) end)
          vim.keymap.set("n", "+d", function() vim.diagnostic.jump({ count=1, float=true, wrap=true }) end)
          -- stylua: ignore end
        end,
      })

      local servers = {
        lua_ls = {},
        eslint = {
          settings = {
            codeAction = {
              disableRuleComment = {
                enable = false,
              },
              showDocumentation = {
                enable = false,
              },
            },
            format = false,
          },
        },
      }

      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        "stylua",
        "prettier",
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
      require("mason-lspconfig").setup({
        ensure_installed = {},
        automatic_installation = true,
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
            require("lspconfig")[server_name].setup(server)
          end,
        },
      })
    end,
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
      settings = {
        expose_as_code_action = { "fix_all", "add_missing_imports", "remove_unused" },
      },
    },
  },
}
