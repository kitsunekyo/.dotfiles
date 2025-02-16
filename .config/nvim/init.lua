-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- mouse
vim.opt.mouse = "a"
vim.opt.mousescroll = "ver:1"
-- visuals
vim.opt.title = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
-- search
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- indentation
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 10
vim.opt.breakindent = true
-- window management
vim.opt.splitbelow = true
vim.opt.splitright = true
-- clipboard
vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)

require("config.lazy")

-- keymaps
local map = vim.keymap.set
map("i", "jj", "<esc>", { desc = "Exit insert mode" })
map("n", "<Esc>", "<cmd>nohlsearch<CR>")
map("n", "x", '"_x')
map("n", "<C-z>", ":set wrap!<CR>", { desc = "Toggle line wrap" })
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
map("n", "<leader>v", "<C-v>", { desc = "Visual Block mode" })
-- scrolling
map("n", "<C-e>", "5<C-e>")
map("n", "<C-y>", "5<C-y>")
-- move/copy lines
map("n", "<A-j>", ":m .+1<cr>==", { desc = "Move Line Down", noremap = true })
map("n", "<A-k>", ":m .-2<cr>==", { desc = "Move Line Up", noremap = true })
map("n", "<A-J>", "yyp", { desc = "Copy Line Down", noremap = true })
map("n", "<A-K>", "yyP", { desc = "Copy Line Up", noremap = true })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Line Down", noremap = true })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Line Up", noremap = true })
-- file actions
map("n", "<leader>w", ":w!<cr>", { desc = "Write File" })
map("n", "<leader>q", "ZZ", { desc = "Close File", noremap = true })
map("n", "<leader>Q", ":wqa<cr>", { desc = "Close All Files", noremap = true })
map("n", "<leader>rc", ":source $MYVIMRC<cr>", { desc = "Source nvim config", noremap = true })
-- buffers
map("n", "<S-Tab>", "<cmd>b#<cr>", { noremap = true })
-- text editing
map("v", "<Tab>", ">", { noremap = true })
map("v", "<S-Tab>", "<", { noremap = true })
-- tags
map("n", "gt", "<C-]>", { noremap = true })

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
