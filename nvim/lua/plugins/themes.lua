vim.o.background = "dark"

return {
  -- vscode
  {
    "Mofiqul/vscode.nvim",
    lazy = true,
    opts = {
      colorscheme = "vscode",
      -- transparent = true,
    },
    config = function()
      vim.o.background = "dark"
    end,
  },

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
        cmp = true,
        dashboard = true,
        flash = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
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
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
      transparent_background = false,

      -- color_overrides = {
      --   all = {
      --     -- this 16 colors are changed to onedark
      --     base = "#282c34",
      --     mantle = "#353b45",
      --     surface0 = "#3e4451",
      --     surface1 = "#545862",
      --     surface2 = "#565c64",
      --     text = "#abb2bf",
      --     rosewater = "#b6bdca",
      --     lavender = "#c8ccd4",
      --     red = "#e06c75",
      --     peach = "#d19a66",
      --     yellow = "#e5c07b",
      --     green = "#98c379",
      --     teal = "#56b6c2",
      --     blue = "#61afef",
      --     mauve = "#c678dd",
      --     flamingo = "#be5046",
      --
      --     -- now patching extra palettes
      --     maroon = "#e06c75",
      --     sky = "#d19a66",
      --
      --     -- extra colors not decided what to do
      --     pink = "#F5C2E7",
      --     sapphire = "#74C7EC",
      --
      --     subtext1 = "#BAC2DE",
      --     subtext0 = "#A6ADC8",
      --     overlay2 = "#9399B2",
      --     overlay1 = "#7F849C",
      --     overlay0 = "#6C7086",
      --
      --     crust = "#11111B",
      --   },
      -- },
    },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      -- transparent = true,
      -- styles = {
      --   sidebars = "transparent",
      --   floats = "transparent",
      -- },
      lualine_bold = true,
      on_colors = function(c)
        c.bg_dark = "#0e0e0e"
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night",
      -- colorscheme = "vscode",
      -- colorscheme = "catppuccin",
      -- colorscheme = "kanagawa",
    },
  },
}
