return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"windwp/nvim-ts-autotag",
	},
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			highlight = {
				enable = true,
			},
			sync_install = false,
			ignore_install = { "javascript", "dart" },
			auto_install = true,
			indent = {
				enable = true,
				disable = { "dart" },
			},
			autotag = {
				enable = true,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					node_incremental = "v",
					scope_incremental = false,
					node_decremental = "V",
				},
			},
		})
	end,
}
