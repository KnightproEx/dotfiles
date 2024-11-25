return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		require("noice").setup({
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			presets = {
				bottom_search = true,
				-- command_palette = true,
				long_message_to_split = true,
				inc_rename = true,
				lsp_doc_border = true,
			},
			timeout = 5000,
			render = "minimal",
			stages = "fade_in_slide_out",
			on_open = function(win)
				vim.api.nvim_win_set_config(win, { focusable = false })
			end,
		})

		vim.keymap.set("n", "<Esc>", function()
			require("noice").cmd("dismiss")
		end, { desc = "[Noice] dismiss notify popup" })

		vim.keymap.set("n", "<leader>nt", function()
			require("noice").cmd("telescope")
		end, { desc = "[Noice] show notification in telescope" })
	end,
}
