return {
  "petertriho/nvim-scrollbar",
  event = "BufReadPost",
  opts = {
    set_highlights = false,
    excluded_filetypes = {
      "prompt",
      "TelescopePrompt",
      "noice",
      "neo-tree",
      "minifiles",
      "mini.files",
      "dashboard",
      "alpha",
      "lazy",
      "mason",
      "DressingInput",
      "",
    },
    -- handle = {
    --   -- color = "#CE9178",
    -- },
    handlers = {
      cursor = false,
      gitsigns = true,
    },
    -- marks = {
    --   Search = { color = colors.orange },
    --   Error = { color = colors.error },
    --   Warn = { color = colors.warning },
    --   Info = { color = colors.info },
    --   Hint = { color = colors.hint },
    --   Misc = { color = colors.purple },
    -- },
  },
}
