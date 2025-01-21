require("config.lazy")

-- visuals
vim.opt.title = true
vim.opt.number = true
vim.opt.relativenumber = true
-- vim.opt.laststatus = 0
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
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "q", "<c-v>")
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("n", "<Leader>w", ":update<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>q", ":quit<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-z>", ":set wrap!<CR>", { noremap = true, silent = true })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>")

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
