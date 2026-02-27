return {
  {
    "folke/snacks.nvim",
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
