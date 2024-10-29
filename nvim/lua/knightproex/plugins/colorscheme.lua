return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			local catppuccin = require("catppuccin")
			catppuccin.setup({
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					treesitter = true,
				},
			})
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
}
