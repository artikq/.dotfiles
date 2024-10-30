return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      local lualine_require = require("lualine_require")
      lualine_require.require = require

      local opts = {
        options = {
          icons_enabled = true,
          component_separators = "|",
          section_separators = "",
        },
        sections = {
          -- lualine_a = {
          --   "diagnostics",
          -- }
          lualine_x = {
            {
              require("noice").api.status.command.get,
              cond = function()
                return package.loaded["noice"] and require("noice").api.status.command.has()
              end,
              color = { fg = "#ff9e64" },
            },
            {
              require("noice").api.status.mode.get,
              cond = function()
                return package.loaded["noice"] and require("noice").api.status.mode.has()
              end,
              color = { fg = "#ff9e64" },
            },
          },

          lualine_a = {
            {
              "buffers",
              show_modified_status = true, -- Shows indicator when the buffer is modified.
              use_mode_colors = true,
            },
            -- {
            --   "filename",
            --   symbols = {
            --     modified = "●",
            --   },
            -- },
          },
          lualine_c = {},
          lualine_z = {},
        },
      }

      return opts
    end,
  },
}
