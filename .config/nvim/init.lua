vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.lazy")

vim.opt.mouse = "a"
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

-- keymaps
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>", { desc = "Source current file" })
vim.keymap.set("i", "jj", "<esc>")
vim.keymap.set("n", "==", "gg=G''", { desc = "Format buffer" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "q", "<c-v>", { desc = "Visual Block mode" })
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("n", "<Leader>w", ":update<CR>", { desc = "Write file" })
vim.keymap.set("n", "<Leader>q", ":quit<CR>", { desc = "Quit file" })
vim.keymap.set("n", "<Leader>Q", ":quit!<CR>", { desc = "Force quit file" })
vim.keymap.set("n", "<C-z>", ":set wrap!<CR>", { desc = "Toggle line wrap" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

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
