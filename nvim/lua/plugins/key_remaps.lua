return {
  {
    "folke/persistence.nvim",
    keys = function()
      return {
        {
          "<leader>Qs",
          function()
            require("persistence").load()
          end,
          desc = "Restore Session",
        },
        {
          "<leader>QS",
          function()
            require("persistence").select()
          end,
          desc = "Select Session",
        },
        {
          "<leader>Ql",
          function()
            require("persistence").load({ last = true })
          end,
          desc = "Restore Last Session",
        },
        {
          "<leader>Qd",
          function()
            require("persistence").stop()
          end,
          desc = "Don't Save Current Session",
        },
      }
    end,
  },

  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        {
          "<leader>w",
          desc = "save",
          group = false,
          proxy = false,
          expand = false,
        },
        {
          "<leader>W",
          group = "windows",
          proxy = "<c-w>",
          expand = function()
            return require("which-key.extras").expand.win()
          end,
        },
        { "<leader>wm", hidden = true },
        { "<leader>Wm", desc = "[M]aximize [W]indow" },
        { "<leader>Q", group = "Session/Quit all" },
        { "<leader>q", group = false },
      },
    },
  },

  {
    "folke/noice.nvim",
    opts = {
      lsp = {
        signature = {
          auto_open = { enabled = false },
        },
      },
    },
  },
}
