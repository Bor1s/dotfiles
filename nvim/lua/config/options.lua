-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- vim.g.netrw_winsize = 25
-- vim.g.netrw_keepdir = 0

vim.wo.relativenumber = false

-- vim.lsp.set_log_level("debug")

-- Copy full path to current file + line number.
vim.cmd([[
  nnoremap ,c :let @* = expand("%:p").":".line('.')<cr>
]])

-- Fugitive config
vim.cmd([[
  set diffopt+=vertical
]])
