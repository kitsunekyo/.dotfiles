-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- remap ü+ to [] to mimic US ansi for better movements with iso keyboards
-- umlaut mappings dont work.
-- see https://github.com/neovim/neovim/issues/27776
vim.opt.langmap = "ü+Ü*öÖ;[]{}\\;:"
vim.keymap.set("n", "[ü", "[[", { desc = "Sections backward", noremap = true })
vim.keymap.set("n", "]ä", "]]", { desc = "Sections backward", noremap = true })
vim.keymap.set("n", "üb", ":bp<cr>", { desc = "Previous buffer", noremap = true }) -- prev buffer
vim.keymap.set("n", "üq", ":cp<cr>", { desc = "Previous quickfix", noremap = true }) -- prev quickfix
vim.keymap.set("n", "ül", ":lp<cr>", { desc = "Previous location", noremap = true }) -- prev location
vim.keymap.set("n", "üt", ":tp<cr>", { desc = "Previous tag", noremap = true }) -- prev tag
vim.keymap.set("n", "ü<space>", "O<esc>j", { desc = "Insert line above", noremap = true }) -- insert line above

-- bootstrap lazy.nvim
require("config.lazy")

-- mouse
vim.o.mouse = "a"
-- visuals
vim.g.have_nerd_font = true
vim.o.title = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 10
vim.o.termguicolors = true
vim.o.signcolumn = "yes"

-- decrease update time
vim.o.updatetime = 250

-- search
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.inccommand = "split"

-- indentation
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.breakindent = true

-- fold
vim.o.foldlevel = 99
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- Prefer LSP folding if client supports it
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client:supports_method("textDocument/foldingRange") then
      local win = vim.api.nvim_get_current_win()
      vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
    end
  end,
})
vim.o.foldtext = ""
vim.opt.foldcolumn = "0"
vim.opt.fillchars:append({ fold = " " })

-- completion
vim.o.completeopt = "menuone,noinsert,noselect"
vim.opt.shortmess = vim.opt.shortmess + "c"
vim.lsp.inlay_hint.enable()

-- window management
vim.o.splitbelow = true
vim.o.splitright = true
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- clipboard
vim.schedule(function()
  vim.o.clipboard = "unnamedplus"
end)

vim.keymap.set("i", "jk", "<esc>", { desc = "Exit insert mode" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<leader>v", "<C-v>", { desc = "Visual Block mode", noremap = true })
-- text editing
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("n", "<leader>d", '"_d', { desc = "Delete without register", noremap = true })
vim.keymap.set("n", "<leader>c", '"_c', { desc = "Change without register", noremap = true })
vim.keymap.set("n", "gh", "^", { desc = "Jump to first character", noremap = true })
vim.keymap.set("n", "gl", "$", { desc = "Jump to last character", noremap = true })
vim.keymap.set("v", "<Tab>", ">gv", { noremap = true })
vim.keymap.set("v", "<S-Tab>", "<gv", { noremap = true })

-- move/copy lines
vim.keymap.set("n", "<A-j>", ":m .+1<cr>==", { desc = "Move Line Down", noremap = true })
vim.keymap.set("n", "<A-k>", ":m .-2<cr>==", { desc = "Move Line Up", noremap = true })
vim.keymap.set("n", "<A-J>", "yyp", { desc = "Copy Line Down", noremap = true })
vim.keymap.set("n", "<A-K>", "yyP", { desc = "Copy Line Up", noremap = true })
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Line Down", noremap = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Line Up", noremap = true })
vim.keymap.set("n", "∆", ":m .-2<cr>==", { desc = "Move Line Up", noremap = true })
-- mac specifics for option/alt
vim.keymap.set("n", "º", ":m .+1<cr>==", { desc = "Move Line Down", noremap = true })
vim.keymap.set("v", "º", ":m '>+1<cr>gv=gv", { desc = "Move Line Down", noremap = true })
vim.keymap.set("v", "∆", ":m '<-2<cr>gv=gv", { desc = "Move Line Up", noremap = true })

-- scrolling
vim.keymap.set("n", "<C-e>", "5<C-e>")
vim.keymap.set("n", "<C-y>", "5<C-y>")

-- file actions
vim.keymap.set("n", "<leader>w", ":w!<cr>", { desc = "Write File" })
vim.keymap.set("n", "<leader>rc", ":source $MYVIMRC<cr>", { desc = "Source nvim config", noremap = true })

-- buffers
vim.keymap.set("n", "<S-Tab>", "<cmd>bp<cr>", { noremap = true, desc = "Previous buffer" })
vim.keymap.set("n", "<Tab>", "<cmd>bn<cr>", { noremap = true, desc = "Next buffer" })

-- tags
vim.keymap.set("n", "gt", "<C-]>", { noremap = true })

-- toggle
vim.keymap.set("n", "<leader>tw", ":set wrap!<CR>", { desc = "Linewrap" })

-- autocommands
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})

if os.getenv("WSL_INTEROP") ~= nil then
  vim.g.clipboard = {
    name = "WslClipboard",
    copy = {
      ["+"] = "clip.exe",
      ["*"] = "clip.exe",
    },
    paste = {
      ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = 0,
  }
end
