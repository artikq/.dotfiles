-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
augroup("mygroup", { clear = true })

autocmd("Filetype", {
  pattern = { "*" },
  callback = function()
    -- vim.opt.formatoptions = vim.opt.formatoptions - "o"
    if vim.bo["ft"] == "css" then
      vim.opt_local.formatoptions:remove("r") -- don't enter comment leader on Enter in css files
    end
    vim.opt.formatoptions = vim.opt.formatoptions + {
      o = false, -- Don't continue comments with o and O
    }
  end,
  group = "mygroup",
  desc = "Don't continue comments with o and O",
})

local lsp_hacks = vim.api.nvim_create_augroup("LspHacks", { clear = true })
-- disables warnings in .env files
vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost" }, {
  group = lsp_hacks,
  pattern = ".env*",
  callback = function(e)
    vim.diagnostic.enable(false, { bufnr = e.buf })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "txt" },
  callback = function()
    vim.opt_local.spell = false
  end,
})

-- NOTE: Snacks `notifier` will override `vim.notify`
local notify = vim.notify
vim.notify = function(msg, lvl, opts) ---@diagnostic disable-line
  if msg:match("^Terminal exited with code") then
    return
  end
  notify(msg, lvl, opts)
end
vim.api.nvim_create_autocmd("TermClose", {
  group = vim.api.nvim_create_augroup("term_autoclose", { clear = true }),
  callback = function()
    if vim.v.event.status ~= 0 then
      vim.schedule(function()
        vim.api.nvim_input("<CR>")
      end)
    end
  end,
})
