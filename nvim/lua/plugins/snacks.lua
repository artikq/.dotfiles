return {
  {
    "folke/snacks.nvim",
    opts = {
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
