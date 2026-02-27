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
local function run_in_terminal(cmd)
  local term = Snacks.terminal.get(nil, { auto_insert = true })
  local is_new = not vim.b[term.buf].term_initialized
  if is_new then
    vim.b[term.buf].term_initialized = true
  end
  vim.defer_fn(function()
    local chan = vim.bo[term.buf].channel
    vim.fn.chansend(chan, "\x03\x15\x0c" .. cmd .. "\n")
  end, is_new and 1000 or 100)
  term:show()
end

local function normalize_key(key)
  local k = key:lower()
  if k:match("^f%d+$") then
    return "<" .. k:upper() .. ">"
  end
  return key
end

local function load_project_keymaps()
  local root = Snacks.git.get_root() or vim.fn.getcwd()
  local config_path = root .. "/.local/nvim.conf.json"
  local f = io.open(config_path, "r")
  if not f then
    return
  end
  local content = f:read("*a")
  f:close()
  local ok, config = pcall(vim.json.decode, content)
  if not ok or type(config) ~= "table" then
    return
  end
  for key, cmd in pairs(config) do
    vim.keymap.set({ "n", "t" }, normalize_key(key), function()
      run_in_terminal(cmd)
    end, { desc = cmd })
  end
end

load_project_keymaps()
