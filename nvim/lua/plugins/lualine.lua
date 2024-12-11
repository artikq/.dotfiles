return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      local lualine_require = require("lualine_require")
      lualine_require.require = require

      local icons = LazyVim.config.icons

      local opts = {
        options = {
          icons_enabled = true,
          component_separators = "|",
          section_separators = "",
          globalstatus = vim.o.laststatus == 3,
          disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
          theme = "tokyonight",
        },
        sections = {
          lualine_a = {
            {
              "buffers",
              show_modified_status = true, -- Shows indicator when the buffer is modified.
              use_mode_colors = true,
            },
          },
          lualine_b = {},
          lualine_c = {
            {
              "filename",
              cond = function()
                return false
              end,
            },
          },

          lualine_x = {
            -- {
            --   require("noice").api.status.message.get_hl,
            --   cond = require("noice").api.status.message.has,
            -- },
            -- {
            --   require("noice").api.status.command.get,
            --   cond = require("noice").api.status.command.has,
            --   color = { fg = "#ff9e64" },
            -- },
            {
              -- stylua: ignore
              require("noice").api.status.mode.get,
              cond = require("noice").api.status.mode.has,
              color = { fg = "#ff9e64" },
            },
            {
              require("noice").api.status.search.get,
              cond = require("noice").api.status.search.has,
              color = { fg = "#ff9e64" },
            },
          },
          lualine_y = {
            {
              function()
                return "  " .. require("dap").status()
              end,
              cond = function()
                return package.loaded["dap"] and require("dap").status() ~= ""
              end,
              color = function()
                return LazyVim.ui.fg("Debug")
              end,
            },

            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.error,
                warn = icons.diagnostics.warn,
                info = icons.diagnostics.info,
                hint = icons.diagnostics.hint,
              },
            },
          },
          lualine_z = {
            -- {
            --   "diagnostics",
            --   symbols = {
            --     error = icons.diagnostics.error,
            --     warn = icons.diagnostics.warn,
            --     info = icons.diagnostics.info,
            --     hint = icons.diagnostics.hint,
            --   },
            -- },
          },
        },
      }

      return opts
    end,
  },
}
