-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'Mofiqul/vscode.nvim',
    lazy = false,
    opts = {
      colorscheme = 'vscode',
      transparent = true,
      underline_links = true,
      color_overrides = {
        vscLineNumber = '#FFFFFF',
      },
    },
    init = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      -- vim.cmd.colorscheme 'vscode'
      vim.o.background = 'dark'
    end,
  },
}
