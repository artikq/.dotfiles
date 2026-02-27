return {
  {
    "folke/noice.nvim",
    opts = {
      cmdline = {
        view = "cmdline",
        format = {
          cmdline = { view = "cmdline" },
          search_down = { view = "cmdline" },
          search_up = { view = "cmdline" },
          filter = { view = "cmdline" },
          lua = { view = "cmdline" },
          help = { view = "cmdline" },
        },
      },
      messages = {
        view_search = true,
      },
      routes = {
        -- Hide written messages ("init.lua" 2L, 72B)
        { filter = { event = "msg_show", kind = "", find = "written" }, opts = { skip = true } },
        -- Route search count to lualine (handled by noice search status)
        { filter = { event = "msg_show", kind = "search_count" }, view = "mini" },
        -- Send short messages to mini view (fades quickly)
        { filter = { event = "msg_show", kind = "" }, view = "mini" },
      },
      lsp = {
        signature = {
          auto_open = { enabled = false },
        },
        -- Let noice handle LSP hover/signature instead of default
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = true, -- search bar at bottom
        command_palette = false, -- classic bottom cmdline, not popup
        long_message_to_split = true, -- long messages go to split
        lsp_doc_border = true, -- border on LSP hover docs
      },
    },
  },
}
