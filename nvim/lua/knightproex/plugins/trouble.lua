-- return {
-- 	"folke/trouble.nvim",
-- 	dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
-- 	opts = function(_, opts)
-- 		return vim.tbl_deep_extend("force", opts or {}, {
-- 			picker = {
-- 				actions = require("trouble.sources.snacks").actions,
-- 				win = {
-- 					input = {
-- 						keys = {
-- 							["<c-t>"] = {
-- 								"trouble_open",
-- 								mode = { "n", "i" },
-- 							},
-- 						},
-- 					},
-- 				},
-- 			},
-- 		})
-- 	end,
-- 	cmd = "Trouble",
-- 	keys = {
-- 		{
-- 			"<leader>xw",
-- 			"<cmd>Trouble diagnostics toggle<CR>",
-- 			desc = "Open trouble workspace diagnostics",
-- 		},
-- 		{
-- 			"<leader>xd",
-- 			"<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
-- 			desc = "Open trouble document diagnostics",
-- 		},
-- 		{ "<leader>xq", "<cmd>Trouble quickfix toggle<CR>", desc = "Open trouble quickfix list" },
-- 		{ "<leader>xl", "<cmd>Trouble loclist toggle<CR>", desc = "Open trouble location list" },
-- 		{ "<leader>xt", "<cmd>Trouble todo toggle<CR>", desc = "Open todos in trouble" },
-- 	},
-- }

return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
	cmd = "Trouble",
	keys = {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Diagnostics (Trouble)",
		},
		{
			"<leader>xX",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Buffer Diagnostics (Trouble)",
		},
		{
			"<leader>cs",
			"<cmd>Trouble symbols toggle focus=false<cr>",
			desc = "Symbols (Trouble)",
		},
		{
			"<leader>cl",
			"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			desc = "LSP Definitions / references / ... (Trouble)",
		},
		{
			"<leader>xL",
			"<cmd>Trouble loclist toggle<cr>",
			desc = "Location List (Trouble)",
		},
		{
			"<leader>xQ",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "Quickfix List (Trouble)",
		},
	},
}
