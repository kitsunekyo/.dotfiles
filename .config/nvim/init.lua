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
vim.keymap.set("i", "jj", "<esc>", { desc = "Exit insert mode" })
vim.keymap.set("n", "<Leader><Leader>x", "<cmd>source %<CR>", { desc = "Source current file" })
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
