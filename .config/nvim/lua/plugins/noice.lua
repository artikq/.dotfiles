return {
  {
    "folke/noice.nvim",
    opts = {
      cmdline = {
        view = "cmdline",
      },
      routes = {
        -- Skip ALL informational messages (write confirmations, undo messages, etc.)
        -- Only warnings and errors will show
        { filter = { event = "msg_show", kind = "" }, opts = { skip = true } },
        { filter = { event = "msg_show", kind = "search_count" }, opts = { skip = true } },
        { filter = { event = "msg_show", find = "%d+L, %d+B" }, opts = { skip = true } },
        { filter = { event = "msg_show", find = "; after #%d+" }, opts = { skip = true } },
        { filter = { event = "msg_show", find = "; before #%d+" }, opts = { skip = true } },
      },
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = false,
        command_palette = false,
        long_message_to_split = true,
        lsp_doc_border = true,
      },
    },
  },
}
