local icons = LazyVim.config.icons
return {
  {
    "vimpostor/vim-tpipeline",
    event = "VeryLazy",
    dependencies = {
      "nvim-lualine/lualine.nvim",
      "folke/snacks.nvim",
    },
    init = function()
      vim.g.tpipeline_autoembed = 1
      vim.g.tpipeline_clearstl = 1
      vim.g.tpipeline_cursormoved = 0
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    enabled = true,
    opts = {
      options = {
        icons_enabled = true,
        component_separators = "|",
        section_separators = "",
        disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard", "minifiles" } },
      },
      sections = {
        lualine_a = {
          {
            "filename",
            file_status = true,
          },
        },
        lualine_b = { "diagnostics" },
        lualine_c = {},

        lualine_x = {
          {
            function()
              local pattern = vim.fn.getreg("/")
              if pattern == "" then
                return ""
              end
              local count = vim.fn.searchcount({ maxcount = 999 })
              if count.total and count.total > 0 then
                return "/" .. pattern .. " [" .. count.current .. "/" .. count.total .. "]"
              end
              return "/" .. pattern
            end,
            cond = function()
              return vim.v.hlsearch == 1
            end,
            color = { fg = "#ff9e64" },
          },

          -- Snacks.profiler.status(),
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
        },
        lualine_y = {},
        lualine_z = {
          {
            "datetime",
            -- options: default, us, uk, iso, or your own format string ("%H:%M", etc..)
            style = "%H:%M",
          },
        },
      },
    },
    -- opts = function()
    --   local lualine_require = require("lualine_require")
    --   lualine_require.require = require
    --   local icons = LazyVim.config.icons
    --   vim.o.laststatus = 0
    --   local opts = {
    --     options = {
    --       icons_enabled = true,
    --       component_separators = "|",
    --       section_separators = "",
    --       globalstatus = vim.o.laststatus == 3,
    --       disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard", "minifiles" } },
    --       -- theme = "catppuccin",
    --     },
    --     -- sections = {},
    --     -- inactive_sections = {},
    --     sections = {
    --       lualine_a = {
    --         {
    --           "filename",
    --           -- newfile_status = true,
    --           file_status = true,
    --         },
    --         -- {
    --         --
    --         --   "buffers",
    --         --   show_modified_status = true, -- Shows indicator when the buffer is modified.
    --         --   -- use_mode_colors = true,
    --         --   show_filename_only = true, -- Shows shortened relative path when set to false.
    --         -- },
    --       },
    --       lualine_b = { "diagnostics" },
    --       lualine_c = {},
    --
    --       lualine_x = {
    --         {
    --           function()
    --             local pattern = vim.fn.getreg("/")
    --             if pattern == "" then
    --               return ""
    --             end
    --             local count = vim.fn.searchcount({ maxcount = 999 })
    --             if count.total and count.total > 0 then
    --               return "/" .. pattern .. " [" .. count.current .. "/" .. count.total .. "]"
    --             end
    --             return "/" .. pattern
    --           end,
    --           cond = function()
    --             return vim.v.hlsearch == 1
    --           end,
    --           color = { fg = "#ff9e64" },
    --         },
    --
    --         Snacks.profiler.status(),
    --         {
    --           function()
    --             return "  " .. require("dap").status()
    --           end,
    --           cond = function()
    --             return package.loaded["dap"] and require("dap").status() ~= ""
    --           end,
    --           color = function()
    --             return { fg = Snacks.util.color("Debug") }
    --           end,
    --         },
    --         -- {
    --         --   require("lazy.status").updates,
    --         --   cond = require("lazy.status").has_updates,
    --         --   color = function()
    --         --     return { fg = Snacks.util.color("Special") }
    --         --   end,
    --         -- },
    --         {
    --           "diff",
    --           symbols = {
    --             added = icons.git.added,
    --             modified = icons.git.modified,
    --             removed = icons.git.removed,
    --           },
    --           source = function()
    --             local gitsigns = vim.b.gitsigns_status_dict
    --             if gitsigns then
    --               return {
    --                 added = gitsigns.added,
    --                 modified = gitsigns.changed,
    --                 removed = gitsigns.removed,
    --               }
    --             end
    --           end,
    --         },
    --       },
    --       lualine_y = {},
    --       lualine_z = {},
    --     },
    --   }
    --   return opts
    -- end,
  },
}
