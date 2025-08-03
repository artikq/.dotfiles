return {
  {
    "vimpostor/vim-tpipeline",
    event = "VeryLazy",
    dependencies = {
      "nvim-lualine/lualine.nvim",
    },
    config = function()
      vim.g.tpipeline_autoembed = 1
      vim.g.tpipeline_clearstl = 1
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    enabled = true,
    opts = function()
      local lualine_require = require("lualine_require")
      lualine_require.require = require

      local icons = LazyVim.config.icons
      vim.o.laststatus = 0
      local opts = {
        options = {
          icons_enabled = true,
          component_separators = "|",
          section_separators = "",
          globalstatus = vim.o.laststatus == 3,
          disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard", "minifiles" } },
          theme = "catppuccin",
        },
        -- sections = {},
        -- inactive_sections = {},
        sections = {
          lualine_a = {
            {
              "filename",
              -- newfile_status = true,
              file_status = true,
            },
            --   {

            --     "buffers",
            --     show_modified_status = true, -- Shows indicator when the buffer is modified.
            --     use_mode_colors = true,
            --     show_filename_only = true, -- Shows shortened relative path when set to false.
            --   },
          },
          lualine_b = { "diagnostics" },
          lualine_c = {
            -- {
            --   "filename",
            --   cond = function()
            --     return false
            --   end,
            --   newfile_status = true,
            -- },
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
            -- {
            --   require("noice").api.status.mode.get,
            --   cond = require("noice").api.status.mode.has,
            --   color = { fg = "#ff9e64" },
            -- },
            -- {
            --   require("noice").api.status.search.get,
            --   cond = require("noice").api.status.search.has,
            --   color = { fg = "#ff9e64" },
            -- },

            Snacks.profiler.status(),
            -- {
            --   function() return require("noice").api.status.command.get() end,
            --   cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
            --   color = function() return { fg = Snacks.util.color("Statement") } end,
            -- },

            {
              function()
                return require("noice").api.status.mode.get()
              end,
              cond = function()
                return package.loaded["noice"] and require("noice").api.status.mode.has()
              end,
              color = function()
                return { fg = Snacks.util.color("Constant") }
              end,
            },
            {
              function()
                return "  " .. require("dap").status()
              end,
              cond = function()
                return package.loaded["dap"] and require("dap").status() ~= ""
              end,
              color = function()
                return { fg = Snacks.util.color("Debug") }
              end,
            },
            {
              require("lazy.status").updates,
              cond = require("lazy.status").has_updates,
              color = function()
                return { fg = Snacks.util.color("Special") }
              end,
            },
            {
              "diff",
              symbols = {
                added = icons.git.added,
                modified = icons.git.modified,
                removed = icons.git.removed,
              },
              source = function()
                local gitsigns = vim.b.gitsigns_status_dict
                if gitsigns then
                  return {
                    added = gitsigns.added,
                    modified = gitsigns.changed,
                    removed = gitsigns.removed,
                  }
                end
              end,
            },
          },
          lualine_y = {
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
