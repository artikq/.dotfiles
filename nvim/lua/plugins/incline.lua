return {
  {
    "b0o/incline.nvim",
    event = "VeryLazy",
    enabled = false,
    config = function()
      require("incline").setup({
        ---@class InclineRenderProps
        ---@field buf number
        ---@field win number
        ---@field focused boolean

        ---@param props InclineRenderProps
        render = function(props)
          if not props.focused then
            return ""
          end

          local count = vim.fn.searchcount({ recompute = 1, maxcount = -1 })
          local contents = vim.fn.getreg("/")
          if string.len(contents) == 0 then
            return ""
          end

          return {
            {
              " ? ",
              group = "dkoStatusKey",
            },
            {
              (" %s "):format(contents),
              group = "IncSearch",
            },
            {
              (" %d/%d "):format(count.current, count.total),
              group = "dkoStatusValue",
            },
          }
        end,

        window = {
          placement = { vertical = "bottom", horizontal = "left" },
          padding = 0,
          -- margin = { vertical = 0, horizontal = 0 },
        },
      })
    end,
  },
}
-- return {
--   "b0o/incline.nvim",
--   event = "VeryLazy",
--   enabled = false,
--   dependencies = {
--     "nvim-tree/nvim-web-devicons",
--   },
--   config = function()
--     require("incline").setup({
--       window = {
--         placement = { vertical = "top", horizontal = "right" },
--         padding = 0,
--         margin = { vertical = 0, horizontal = 0 },
--       },
--       hide = {
--         cursorline = true,
--       },
--       render = function(props)
--         local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
--         if filename == "" then
--           filename = "[No Name]"
--         end
--         local devicons = require("nvim-web-devicons")
--         local ft_icon, ft_color = devicons.get_icon_color(filename)
--
--         local function get_git_diff()
--           local icons = { removed = " ", changed = " ", added = " " }
--           local signs = vim.b[props.buf].gitsigns_status_dict
--           local labels = {}
--           if signs == nil then
--             return labels
--           end
--           for name, icon in pairs(icons) do
--             if tonumber(signs[name]) and signs[name] > 0 then
--               table.insert(labels, { icon .. signs[name] .. " ", group = "Diff" .. name })
--             end
--           end
--           if #labels > 0 then
--             table.insert(labels, { "| " })
--           end
--           return labels
--         end
--
--         local function get_diagnostic_label()
--           local icons = { error = " ", warn = " ", info = " ", hint = " " }
--           local label = {}
--
--           for severity, icon in pairs(icons) do
--             local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
--             if n > 0 then
--               table.insert(label, { icon .. n .. " ", group = "DiagnosticSign" .. severity })
--             end
--           end
--           if #label > 0 then
--             table.insert(label, { "| " })
--           end
--           return label
--         end
--
--         local function get_harpoon_items()
--           local harpoon = require("harpoon")
--           local marks = harpoon:list().items
--           local current_file_path = vim.fn.expand("%:p:.")
--           local label = {}
--
--           for id, item in ipairs(marks) do
--             if item.value == current_file_path then
--               table.insert(label, { id .. " ", guifg = "#FFFFFF", gui = "bold" })
--             else
--               table.insert(label, { id .. " ", guifg = "#434852" })
--             end
--           end
--
--           if #label > 0 then
--             table.insert(label, 1, { "󰛢 ", guifg = "#61AfEf" })
--             table.insert(label, { "| " })
--           end
--           return label
--         end
--
--         local function get_file_name()
--           local label = {}
--           table.insert(label, { (ft_icon or "") .. " ", guifg = ft_color, guibg = "none" })
--           table.insert(label, { vim.bo[props.buf].modified and " " or "", guifg = "#d19a66" })
--           table.insert(label, { filename, gui = vim.bo[props.buf].modified and "bold,italic" or "bold" })
--           if not props.focused then
--             label["group"] = "BufferInactive"
--           end
--
--           return label
--         end
--
--         return {
--           { "", guifg = "#0e0e0e" },
--           {
--             { get_diagnostic_label() },
--             { get_git_diff() },
--             { get_harpoon_items() },
--             { get_file_name() },
--             guibg = "#0e0e0e",
--           },
--           { "", guifg = "#0e0e0e" },
--         }
--       end,
--     })
--   end,
-- }
-- return {
--   {
--     "b0o/incline.nvim",
--     main = "incline",
--     event = "VeryLazy",
--     dependencies = {
--       "nvim-tree/nvim-web-devicons",
--     },
--     keys = {
--       {
--         "<leader>uN",
--         function()
--           require("incline").toggle()
--         end,
--         desc = "Incline Toggle",
--       },
--     },
--     opts = function()
--       local separator = { left = "|", right = "|" } -- vim.g.separators.component
--       return {
--         ---@param props { buf: number, win: number, focused: boolean }
--         ---@return render_result[]
--         render = function(props)
--           local theme = require("lualine.themes." .. vim.g.colors_name)
--           local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
--           local ft_icon, ft_color = require("nvim-web-devicons").get_icon_color(filename)
--           local group = props.focused and "Normal" or "Inactive"
--           local modified = vim.api.nvim_get_option_value("modified", { buf = props.buf })
--           for hl_group, value in pairs({
--             InclineBorderNormal = { fg = theme.normal.b.bg, bg = "NONE" },
--             InclineBorderInactive = { fg = theme.inactive.b.bg, bg = "NONE" },
--             InclineTextNormal = { fg = theme.normal.b.fg, bg = theme.normal.b.bg },
--             InclineTextInactive = { bg = theme.inactive.b.bg, fg = theme.normal.b.fg },
--           }) do
--             vim.api.nvim_set_hl(0, hl_group, value)
--           end
--           local function get_git_diff()
--             local signs, diff = vim.b[props.buf].gitsigns_status_dict or {}, {}
--             local icons = {
--               added = LazyVim.config.icons.git.added,
--               changed = LazyVim.config.icons.git.modified,
--               removed = LazyVim.config.icons.git.removed,
--             }
--             for key, icon in pairs(icons) do
--               if signs[key] and signs[key] ~= 0 then
--                 table.insert(diff, { icon .. signs[key] .. " ", group = "Diff" .. key })
--               end
--             end
--             if #diff > 0 then
--               table.insert(diff, 1, " ")
--             end
--             return diff
--           end
--
--           local function get_harpoon_items()
--             local harpoon = require("harpoon")
--             local marks = harpoon:list().items
--             local current_file_path = vim.fn.expand("%:p:.")
--             local label = {}
--
--             for id, item in ipairs(marks) do
--               if item.value == current_file_path then
--                 table.insert(label, { id .. " ", guifg = "#FFFFFF", gui = "bold" })
--               else
--                 table.insert(label, { id .. " ", guifg = "#434852" })
--               end
--             end
--
--             if #label > 0 then
--               table.insert(label, 1, { "󰛢 ", guifg = "#61AfEf" })
--               table.insert(label, { "| " })
--             end
--             return label
--           end
--
--           local function get_diagnostic_label()
--             local diagnostics = {}
--             for severity, icon in pairs(LazyVim.config.icons.diagnostics) do
--               local n = #vim.diagnostic.get(props.buf, {
--                 severity = vim.diagnostic.severity[string.upper(severity)],
--               })
--               if n > 0 then
--                 table.insert(diagnostics, {
--                   icon .. n .. " ",
--                   group = "DiagnosticSign" .. severity,
--                 })
--               end
--             end
--             if #diagnostics > 0 then
--               table.insert(diagnostics, 1, " ")
--             end
--             return diagnostics
--           end
--           local function expand(render_result)
--             local index = 1
--             while index < #render_result do
--               local value = render_result[index]
--               if #value > 0 then
--                 table.insert(render_result, index + 1, separator.right)
--                 index = index + 1
--               end
--               index = index + 1
--             end
--             return render_result
--           end
--           return #filename > 0
--               and {
--                 {
--                   "|", -- vim.g.separators.section.right
--                   group = "InclineBorder" .. group,
--                 },
--                 expand({
--                   get_diagnostic_label(),
--                   get_git_diff(),
--                   {
--                     ft_icon and { " ", ft_icon, guifg = ft_color } or "",
--                     " ",
--                     {
--                       filename,
--                       gui = modified and "bold" or nil,
--                     },
--                     " ",
--                     modified and "● " or "",
--                   },
--                   get_harpoon_items(),
--                   group = "InclineText" .. group,
--                 }),
--               }
--             or {}
--         end,
--         highlight = {
--           groups = {
--             InclineNormal = { default = false, guifg = "NONE", guibg = "NONE" },
--             InclineNormalNC = { default = false, guifg = "NONE", guibg = "NONE" },
--           },
--         },
--         window = {
--           padding = 0,
--           margin = { vertical = 0, horizontal = 0 },
--           placement = { vertical = "top", horizontal = "right" },
--         },
--       }
--     end,
--   },
-- }
