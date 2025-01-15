require("config.lazy")

-- visuals
vim.opt.title = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.laststatus = 0
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
-- clipboard
vim.opt.clipboard = "unnamedplus"

-- keymaps
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("i", "jj", "<esc>")
vim.keymap.set("n", "==", "gg=G''")
vim.keymap.set("n", "<C-n>", "<cmd>set hlsearch!<CR>")
vim.keymap.set("n", "q", "<c-v>")
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("n", "<Leader>w", ":update<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>q", ":quit<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>Q", ":qa<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-z>", ":set wrap!<CR>", { noremap = true, silent = true })
