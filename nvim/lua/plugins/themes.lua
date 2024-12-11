return {
  -- vscode
  {
    "Mofiqul/vscode.nvim",
    lazy = true,
    opts = {
      colorscheme = "vscode",
      transparent = true,
    },
  },

  -- kanagawa
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    opts = {
      colorscheme = "kanagawa",
    },
    config = function()
      require("kanagawa").setup({
        transparent = true,
        keywordStyle = {
          italic = false,
        },
      })
    end,
  },

  {
    "rose-pine/neovim",
    lazy = true,
    name = "rose-pine",
    opts = {
      colorscheme = "rose-pine",
    },
  },

  -- catppuccin
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
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
      transparent_background = true,
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
