return {
  {
    "lukas-reineke/headlines.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    lazy = true,
    ft = "markdown",
    config = function()
      local bg = "#2B2B2B"

      vim.api.nvim_set_hl(0, "Headline1", { fg = "#33ccff", bg = bg })
      vim.api.nvim_set_hl(0, "Headline2", { fg = "#00bfff", bg = bg })
      vim.api.nvim_set_hl(0, "Headline3", { fg = "#0099cc", bg = bg })
      vim.api.nvim_set_hl(0, "CodeBlock", { bg = bg })
      vim.api.nvim_set_hl(0, "Dash", { fg = "#D19A66", bold = true })

      require("headlines").setup({
        markdown = {
          headline_highlights = { "Headline1", "Headline2", "Headline3" },
          bullet_highlights = { "Headline1", "Headline2", "Headline3" },
          bullets = { "❯", "❯", "❯", "❯" },
          dash_string = "⎯",
          fat_headlines = false,
          query = vim.treesitter.query.parse(
            "markdown",
            [[
                (atx_heading [
                    (atx_h1_marker)
                    (atx_h2_marker)
                    (atx_h3_marker)
                    (atx_h4_marker)
                    (atx_h5_marker)
                    (atx_h6_marker)
                ] @headline)

                (thematic_break) @dash

                (fenced_code_block) @codeblock
            ]]
          ),
        },
      })
    end,
  },

  {
    "obsidian-nvim/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
      legacy_commands = false,
      workspaces = {
        -- {
        --   name = "flow",
        --   path = "~/vaults/flow",
        -- },
        -- {
        --   name = "dev-notes",
        --   path = "~/dev/notes",
        -- },
        {
          name = "personal-notes-tools",
          path = "~/dev/tools/personal",
        },
        {
          name = "dev-notes-tools",
          path = "~/dev/tools/notes",
        },
      },
      frontmatter = {
        enabled = false,
      },
      statusline = {
        enabled = false,
      },

      footer = {
        enabled = false,
      },

      daily_notes = {
        enabled = true,
        folder = "daily",
      },

      checkbox = {
        enabled = true,
        create_new = true,
        order = { " ", "x" },
      },

      ---@diagnostic disable-next-line: missing-fields
      ui = {
        checkboxes = {
          [" "] = { char = "󰄱", hl_group = "obsidiantodo" },
          ["x"] = { char = "", hl_group = "obsidiandone" },
          ["~"] = { char = "󰰱", hl_group = "obsidiantilde" },
          ["!"] = { char = "", hl_group = "obsidianimportant" },
          [">"] = { char = "", hl_group = "obsidianrightarrow" },
          ["?"] = { char = "", hl_group = "obsidianrightarrow" },
        },
      },
    },
  },

  -- {
  --   "epwalsh/obsidian.nvim",
  --   version = "*", -- recommended, use latest release instead of latest commit
  --   lazy = true,
  --   ft = "markdown",
  --   dependencies = {
  --     -- Required.
  --     "nvim-lua/plenary.nvim",
  --     -- see below for full list of optional dependencies 👇
  --     "headlines.nvim",
  --   },
  --   opts = {
  --     workspaces = {
  --       {
  --         name = "dev-notes-tools",
  --         path = "~/dev/tools/notes",
  --       },
  --       {
  --         name = "personal-notes-tools",
  --         path = "~/dev/tools/personal",
  --       },
  --     },
  --     checkboxes = {
  --       [" "] = { order = 1, char = "󰄱", hl_group = "ObsidianTodo" },
  --       ["x"] = { order = 2, char = "", hl_group = "ObsidianDone" },
  --       ["~"] = { order = 3, char = "󰰱", hl_group = "ObsidianTilde" },
  --       ["!"] = { order = 4, char = "", hl_group = "ObsidianImportant" },
  --       ["?"] = { order = 5, char = "", hl_group = "ObsidianTilde" },
  --     },
  --     disable_frontmatter = true,
  --   },
  -- },
}
