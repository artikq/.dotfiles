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
      "mini-files",
      "mini.files",
      "dashboard",
      "alpha",
      "lazy",
      "mason",
      "DressingInput",
      "",
    },
    handlers = {
      cursor = false,
      gitsigns = true,
    },
  },
}
