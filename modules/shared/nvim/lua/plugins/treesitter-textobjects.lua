return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	branch = "main",
	-- lazy = true,
	init = function()
		vim.g.no_plugin_maps = true
	end,
	config = function()
		require("nvim-treesitter-textobjects").setup({
			select = {
				enable = true,
				lookahead = true,
				-- keymaps = {
				-- 	["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
				-- 	["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
				-- 	["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
				-- 	["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },
				--
				-- 	["a:"] = { query = "@property.outer", desc = "Select outer part of an object property" },
				-- 	["i:"] = { query = "@property.inner", desc = "Select inner part of an object property" },
				-- 	["l:"] = { query = "@property.lhs", desc = "Select left part of an object property" },
				-- 	["r:"] = { query = "@property.rhs", desc = "Select right part of an object property" },
				--
				-- 	["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
				-- 	["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },
				--
				-- 	["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
				-- 	["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },
				-- },
			},
		})

		vim.keymap.set({ "x", "o" }, "am", function()
			require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
		end)

		vim.keymap.set({ "x", "o" }, "im", function()
			require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
		end)

		vim.keymap.set({ "x", "o" }, "ac", function()
			require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
		end)

		vim.keymap.set({ "x", "o" }, "ic", function()
			require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
		end)

		vim.keymap.set({ "x", "o" }, "a/", function()
			require("nvim-treesitter-textobjects.select").select_textobject("@comment.outer", "textobjects")
		end)

		vim.keymap.set({ "x", "o" }, "i/", function()
			require("nvim-treesitter-textobjects.select").select_textobject("@comment.inner", "textobjects")
		end)

		vim.keymap.set({ "x", "o" }, "aa", function()
			require("nvim-treesitter-textobjects.select").select_textobject("@parameter.outer", "textobjects")
		end)

		vim.keymap.set({ "x", "o" }, "ia", function()
			require("nvim-treesitter-textobjects.select").select_textobject("@parameter.inner", "textobjects")
		end)
		vim.keymap.set({ "x", "o" }, "ae", function()
			require("nvim-treesitter-textobjects.select").select_textobject("@attribute.outer", "textobjects")
		end)

		vim.keymap.set({ "x", "o" }, "ie", function()
			require("nvim-treesitter-textobjects.select").select_textobject("@attribute.inner", "textobjects")
		end)
	end,
}
