vim.o.background = "dark"

return {
  -- vscode
  -- {
  --   "Mofiqul/vscode.nvim",
  --   lazy = true,
  --   opts = {
  --     colorscheme = "vscode",
  --     -- transparent = true,
  --   },
  --   config = function()
  --     vim.o.background = "dark"
  --   end,
  -- },

  -- kanagawa
  -- {
  --   "rebelot/kanagawa.nvim",
  --   lazy = true,
  --   opts = {
  --     colorscheme = "kanagawa",
  --   },
  --   config = function()
  --     require("kanagawa").setup({
  --       transparent = true,
  --       keywordStyle = {
  --         italic = false,
  --       },
  --     })
  --   end,
  -- },

  -- {
  --   "rose-pine/neovim",
  --   lazy = true,
  --   name = "rose-pine",
  --   opts = {
  --     colorscheme = "rose-pine",
  --   },
  -- },

  -- catppuccin
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      flavour = "mocha",
      integrations = {
        aerial = true,
        alpha = true,
        blink_cmp = true,
        cmp = true,
        dashboard = true,
        flash = true,
        fzf = true,
        gitsigns = true,
        headlines = true,
        harpoon = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
      no_italic = true,
      term_colors = true,
      transparent_background = false,
      -- styles = {
      --   comments = {},
      --   conditionals = {},
      --   loops = {},
      --   functions = {},
      --   keywords = {},
      --   strings = {},
      --   variables = {},
      --   numbers = {},
      --   booleans = {},
      --   properties = {},
      --   types = {},
      -- },
      color_overrides = {
        mocha = {
          base = "#000000",
          -- mantle = "#000000",
          -- crust = "#000000",
        },
      },
    },
  },
  -- {
  --   "folke/tokyonight.nvim",
  --   opts = {
  --     -- transparent = true,
  --     -- styles = {
  --     --   sidebars = "transparent",
  --     --   floats = "transparent",
  --     -- },
  --     lualine_bold = true,
  --     on_colors = function(c)
  --       c.bg_dark = "#0e0e0e"
  --     end,
  --   },
  -- },
  -- {
  --   "navarasu/onedark.nvim",
  --   opts = {
  --     style = "deep",
  --   },
  -- },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "tokyonight-night",
      -- colorscheme = "vscode",
      -- colorscheme = "onedark",
      colorscheme = "catppuccin",
      -- colorscheme = "kanagawa",
    },
  },
}
