vim.o.background = "dark"

return {
  -- {
  --   "projekt0n/github-nvim-theme",
  --   name = "github-theme",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     options = {
  --       -- compile_path = vim.fn.stdpath("cache") .. "/github-theme",
  --       -- compile_file_suffix = "_compiled",
  --       hide_end_of_buffer = true,
  --       hide_nc_statusline = true,
  --       -- transparent = true,
  --       terminal_colors = true,
  --       -- dim_inactive = false,
  --       module_default = true,
  --       styles = {
  --         comments = "NONE",
  --         functions = "NONE",
  --         keywords = "NONE",
  --         variables = "NONE",
  --         conditionals = "NONE",
  --         constants = "NONE",
  --         numbers = "NONE",
  --         operators = "NONE",
  --         strings = "NONE",
  --         types = "NONE",
  --       },
  --       inverse = {
  --         match_paren = false,
  --         visual = false,
  --         search = false,
  --       },
  --       darken = {
  --         floats = true,
  --         sidebars = {
  --           enable = true,
  --           list = {},
  --         },
  --       },
  --       -- modules = {},
  --     },
  --     -- palettes = {},
  --     -- specs = {},
  --     -- groups = {},
  --   },
  -- },
  {
    "sainnhe/everforest",
    config = function()
      vim.g.everforest_enable_italic = false
      -- vim.cmd.colorscheme('everforest')
    end,
  },
  {
    "sainnhe/gruvbox-material",
    config = function()
      vim.g.gruvbox_material_enable_italic = false
      -- vim.cmd.colorscheme('gruvbox-material')
    end,
  },

  {
    "https://codeberg.org/evergarden/nvim.git",
    name = "evergarden",
    opts = {
      theme = {
        variant = "winter", -- 'winter'|'fall'|'spring'|'summer'
      },
      editor = {
        transparent_background = false,
        -- sign = { color = "none" },
        -- float = {
        --   color = "mantle",
        --   solid_border = false,
        -- },
        -- completion = {
        --   color = "surface0",
        -- },
      },
    },
  },
  {
    "yonatan-perel/lake-dweller.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "lake-dweller",
      -- colorscheme = "evergarden",
      -- colorscheme = "everforest",
      -- colorscheme = "gruvbox-material",
    },
  },
}
