local workspaces = {
  { name = "personal-notes-tools", path = "~/dev/tools/personal" },
  { name = "dev-notes-tools", path = "~/dev/tools/notes" },
}

-- load only inside vaults, otherwise it warns on every markdown file outside them
local events = {}
for _, ws in ipairs(workspaces) do
  local pattern = vim.fn.expand(ws.path) .. "/*.md"
  table.insert(events, "BufReadPre " .. pattern)
  table.insert(events, "BufNewFile " .. pattern)
end

return {
  {
    "obsidian-nvim/obsidian.nvim",
    version = "*",
    lazy = true,
    event = events,
    cmd = "Obsidian",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
      legacy_commands = false,
      workspaces = workspaces,
      frontmatter = {
        enabled = false,
      },
      statusline = {
        enabled = false,
      },

      footer = {
        enabled = false,
      },

      daily_notes = {
        enabled = true,
        folder = "daily",
      },

      checkbox = {
        enabled = true,
        create_new = true,
        order = { " ", "x" },
      },

      ---@diagnostic disable-next-line: missing-fields
      ui = {
        checkboxes = {
          [" "] = { char = "󰄱", hl_group = "obsidiantodo" },
          ["x"] = { char = "", hl_group = "obsidiandone" },
          ["~"] = { char = "󰰱", hl_group = "obsidiantilde" },
          ["!"] = { char = "", hl_group = "obsidianimportant" },
          [">"] = { char = "", hl_group = "obsidianrightarrow" },
          ["?"] = { char = "", hl_group = "obsidianrightarrow" },
        },
      },
    },
  },
}
