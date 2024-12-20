return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
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
			ensure_installed = {
				"go",
				"regex",
				"sql",
				"terraform",
				"json",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"toml",
				"html",
				"css",
				"prisma",
				"markdown",
				"markdown_inline",
				"svelte",
				"graphql",
				"bash",
				"lua",
				"vim",
				"dockerfile",
				"gitignore",
				"query",
				"vimdoc",
				"c",
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
