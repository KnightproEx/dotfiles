return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")
		local palette = require("catppuccin.palettes").get_palette()

		local custom_catppuccin = require("lualine.themes.catppuccin")
		custom_catppuccin.normal.c.bg = palette.base

		lualine.setup({
			options = {
				theme = custom_catppuccin,
				component_separators = "|",
				section_separators = "",
			},
			sections = {
				lualine_c = {
					-- { "filename", path = 1 },
				},
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					"filetype",
				},
			},
		})
	end,
}
