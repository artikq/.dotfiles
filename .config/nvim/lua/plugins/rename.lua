return {
  {
    "saecki/live-rename.nvim",
    -- keys = {
    --   "<leader>cr",
    --   function()
    --     require("live-rename").rename({ cursorpos = 0 })
    --   end,
    --   desc = "LSP rename",
    -- },
    opts = function()
      local fooBarBaz = require("live-rename")

      vim.keymap.set("n", "<leader>rn", fooBarBaz.rename, { desc = "LSP rename" })
    end,
  },
}
