-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

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
vim.o.foldmethod = "indent"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.breakindent = true

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

vim.keymap.set("i", "jj", "<esc>", { desc = "Exit insert mode" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<leader>v", "<C-v>", { desc = "Visual Block mode" })

-- scrolling
vim.keymap.set("n", "<C-e>", "5<C-e>")
vim.keymap.set("n", "<C-y>", "5<C-y>")

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

-- file actions
vim.keymap.set("n", "<leader>w", ":w!<cr>", { desc = "Write File" })
vim.keymap.set("n", "<leader>q", "ZZ", { desc = "Close File", noremap = true })
vim.keymap.set("n", "<leader>Q", ":wqa<cr>", { desc = "Close All Files", noremap = true })
vim.keymap.set("n", "<leader>rc", ":source $MYVIMRC<cr>", { desc = "Source nvim config", noremap = true })

-- buffers
vim.keymap.set("n", "<S-Tab>", "<cmd>b#<cr>", { noremap = true, desc = "Tab buffers" })
vim.keymap.set("n", "<leader>dq", "<cmd>bd<cr>", { noremap = true, desc = "Delete buffer" })

-- text editing
vim.keymap.set("v", "<Tab>", ">", { noremap = true })
vim.keymap.set("v", "<S-Tab>", "<", { noremap = true })

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
