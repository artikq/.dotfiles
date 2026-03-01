-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.updatetime = 50
if vim.fn.has("win32") == 1 then
  vim.opt.undodir = vim.fn.stdpath("data") .. "/.vim/undodir"
  vim.o.shell = "cmd.exe /k " .. os.getenv("USERPROFILE") .. "\\dev\\hero\\misc\\initdev.bat"
  vim.o.shellquote = ""
  vim.o.shellxquote = ""
else
  vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
end
vim.opt.undofile = true
vim.g.snacks_animate = false

vim.opt.laststatus = 0
vim.opt.cmdheight = 0

vim.cmd(
  ":set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"
)
