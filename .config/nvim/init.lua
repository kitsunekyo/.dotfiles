require("config.lazy")

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.showcmd = true
vim.opt.laststatus = 0
vim.opt.scrolloff = 10
vim.opt.ignorecase = true
vim.opt.backspace = {"start", "eol", "indent"}
vim.opt.shiftwidth = 2
vim.opt.autoindent = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.clipboard = "unnamedplus"

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("i", "jj", "<esc>")
vim.keymap.set("n", "==", "gg=G''")
vim.keymap.set("n", "<C-n>", "<cmd>set hlsearch!<CR>")
vim.keymap.set("n", "q", "<c-v>")
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("n", "<Leader>w", ":update<Return>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>q", ":quit<Return>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>Q", ":qa<Return>", { noremap = true, silent = true })
