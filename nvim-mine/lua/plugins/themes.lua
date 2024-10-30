return {
	{
		"Mofiqul/vscode.nvim",
		-- opts = {
		-- 	colorscheme = "vscode",
		-- 	transparent = true,
		-- },
		opts = {
			colorscheme = "vscode",
			transparent = true,
			underline_links = true,
			color_overrides = {
				vscLineNumber = "#FFFFFF",
			},
		},
		init = function()
			-- Load the colorscheme here.
			-- Like many other themes, this one has different styles, and you could load
			-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
			vim.cmd.colorscheme("vscode")
			vim.o.background = "dark"
		end,
	},

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
}
