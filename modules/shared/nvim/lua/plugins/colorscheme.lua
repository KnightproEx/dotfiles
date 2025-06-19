return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			custom_highlights = {
				FloatBorder = { fg = "#b4befe" },
			},
			integrations = {
				noice = true,
				notify = true,
				which_key = true,
				alpha = true,
				lsp_trouble = true,
				nvim_surround = true,
				mason = true,
				indent_blankline = {
					enabled = true,
					scope_color = "lavender",
					colored_indent_levels = true,
				},
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
						ok = { "italic" },
					},
					underlines = {
						errors = { "undercurl" },
						hints = { "undercurl" },
						warnings = { "undercurl" },
						information = { "undercurl" },
						ok = { "undercurl" },
					},
				},
			},
		})
		vim.cmd.colorscheme("catppuccin-mocha")
	end,
}
