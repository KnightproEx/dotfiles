return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				-- layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.6,
					},
				},
				file_ignore_patterns = { ".git/", "node_modules/", ".data/" },
				sorting_strategy = "ascending",
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
		})

		telescope.load_extension("fzf")

		local keymap = vim.keymap

		keymap.set(
			"n",
			"<leader>ff",
			"<cmd>Telescope find_files hidden=true<cr>",
			{ desc = "[Telescope] find files in cwd" }
		)
		keymap.set(
			"n",
			"<leader>fh",
			"<cmd>Telescope find_files hidden=true<cr>",
			{ desc = "[Telescope] find hidden files in cwd" }
		)
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "[Telescope] find recent files" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "[Telescope] find string in cwd" })
		keymap.set(
			"n",
			"<leader>fc",
			"<cmd>Telescope grep_string<cr>",
			{ desc = "[Telescope] find string under cursor in cwd" }
		)
		keymap.set(
			"n",
			"<leader>fb",
			"<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
			{ desc = "[Telescope] find buffers" }
		)
		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "[Telescope] Find todos" })
	end,
}
