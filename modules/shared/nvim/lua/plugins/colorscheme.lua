return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			custom_highlights = {
				FloatBorder = { fg = "#b4befe" },
			},
      lsp_styles = {
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
        inlay_hints = {
          background = true,
        },
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
        blink_cmp = {
          style = 'bordered',
        },
			},
		})
		vim.cmd.colorscheme("catppuccin-mocha")
	end,
}
