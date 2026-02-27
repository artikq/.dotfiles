return {
  "neovim/nvim-lspconfig",
  -- other settings removed for brevity
  opts = {
    ---@type table<string, vim.lsp.Config>
    servers = {
      eslint = {
        settings = {
          -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
          workingDirectories = { mode = "auto" },
          format = true,
        },
      },
    },
    setup = {
      eslint = function()
        local formatter = LazyVim.lsp.formatter({
          name = "eslint: lsp",
          primary = true,
          priority = 200,
          filter = "eslint",
        })

        -- register the formatter with LazyVim
        LazyVim.format.register(formatter)
      end,
    },
  },
}
