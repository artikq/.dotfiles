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

return {
  {
    "folke/snacks.nvim",
    config = function(_, opts)
      require("snacks").setup(opts)
      load_project_keymaps()
    end,
    opts = {
      terminal = {
        win = {
          style = "terminal",
          position = "right",
        },
      },
      lazygit = {
        win = {
          style = "lazygit",
          position = "float",
        },
      },
      picker = {
        sources = {
          files = {
            hidden = true,
          },
          grep = {
            hidden = true,
          },
        },
        win = {
          input = {
            keys = {
              ["<a-e>"] = { "toggle_hidden", mode = { "i", "n" } },
            },
          },
          list = {
            keys = {
              ["<a-e>"] = "toggle_hidden",
            },
          },
        },
      },
    },
  },
}
