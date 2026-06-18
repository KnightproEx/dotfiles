return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	init = function()
		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				-- Enable treesitter highlighting and disable regex syntax
				pcall(vim.treesitter.start)
				-- Enable treesitter-based indentation
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})

		local ensureInstalled = {
			"hcl",
			"terraform",
			"regex",
			"javascript",
			"latex",
			"scss",
			"svelte",
			"vue",
			"css",
			"html",
			"typescript",
			"javascript",
			"tsx",
			"rust",
			"lua",
			"markdown",
			"nix",
			"dockerfile",
			"yaml",
			"zsh",
			"bash",
			"dart",
			"java",
			"gitignore",
			"go",
			"ini",
			"json",
			"nu",
			"terraform",
			"helm",
			"jinja",
			"python",
			"zig",
			"toml",
		}
		local alreadyInstalled = require("nvim-treesitter.config").get_installed()
		local parsersToInstall = vim.iter(ensureInstalled)
			:filter(function(parser)
				return not vim.tbl_contains(alreadyInstalled, parser)
			end)
			:totable()
		require("nvim-treesitter").install(parsersToInstall)
	end,
	-- config = function()
	-- 	local treesitter = require("nvim-treesitter.configs")
	--
	-- 	treesitter.setup({
	-- 		highlight = {
	-- 			enable = true,
	-- 		},
	-- 		sync_install = false,
	-- 		ignore_install = { "javascript", "dart" },
	-- 		auto_install = true,
	-- 		ensure_installed = {
	-- 			"hcl",
	-- 			"terraform",
	-- 			"regex",
	-- 			"javascript",
	-- 			"latex",
	-- 			"norg",
	-- 			"scss",
	-- 			"svelte",
	-- 			"typst",
	-- 			"vue",
	-- 			"css",
	-- 			"html",
	-- 			"javascript",
	-- 			"tsx",
	-- 		},
	-- 		indent = {
	-- 			enable = true,
	-- 			disable = { "dart" },
	-- 		},
	-- 		autotag = {
	-- 			enable = true,
	-- 		},
	-- 		incremental_selection = {
	-- 			enable = true,
	-- 			keymaps = {
	-- 				node_incremental = "v",
	-- 				scope_incremental = false,
	-- 				node_decremental = "V",
	-- 			},
	-- 		},
	-- 	})
	-- end,
}
