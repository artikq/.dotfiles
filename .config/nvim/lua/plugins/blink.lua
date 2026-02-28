return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      accept = {
        auto_brackets = {
          enabled = true,
        },
      },
      trigger = {
        show_on_trigger_character = true,
        show_on_insert_on_trigger_character = true,
        show_on_accept_on_trigger_character = true,
      },
      ghost_text = { enabled = true },
      -- show_on_blocked_trigger_characters = {},
    },
    sources = {
      default = { "lsp", "path" },
      providers = {
        lsp = {
          override = {
            get_trigger_characters = function(self)
              local trigger_characters = self:get_trigger_characters()
              vim.list_extend(trigger_characters, { "\n", "\t", " " })
              return trigger_characters
            end,
          },
        },
      },
    },
  },
}
