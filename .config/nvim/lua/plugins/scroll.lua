return {
  "petertriho/nvim-scrollbar",

  dependencies = {
    "kevinhwang91/nvim-hlslens",
  },
  event = "BufReadPost",
  opts = {
    set_highlights = true,
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
    handle = {
      -- color = "#A9A9A9",
    },
    handlers = {
      cursor = false,
      diagnostic = true,
      gitsigns = false, -- Requires gitsigns
      handle = true,
      search = true, -- Requires hlslens
      ale = false, --
    },
    marks = {
      Search = { color = "#FFA500", color_nr = 214 },
      Error = { color = "#FF0000", color_nr = 196 },
      Warn = { color = "#FFFF00", color_nr = 226 },
      Info = { color = "#0000FF", color_nr = 21 },
      Hint = { color = "#40E0D0", color_nr = 37 },
      Misc = { color = "#D3D3D3", color_nr = 250 },
    },
  },
}
