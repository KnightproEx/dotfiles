return {
	"folke/noice.nvim",
	-- event = "VeryLazy",
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
				hover = { enabled = true },
				signature = { enabled = true },
			},
			presets = {
				bottom_search = true,
				long_message_to_split = true,
				lsp_doc_border = true,
			},
			routes = {
				{
					filter = {
						event = "msg_show",
						kind = "",
						any = {
							{ find = "no lines in buffer" },
							{ find = "no manual entry for" },

							-- Edit
							{ find = "%d+ less lines" },
							{ find = "%d+ fewer lines" },
							{ find = "%d+ more lines" },
							{ find = "%d+ change;" },
							{ find = "%d+ line less;" },
							{ find = "%d+ more lines?;" },
							{ find = "%d+ fewer lines;?" },
							{ find = '".+" %d+L, %d+B' },
							{ find = "%d+ lines yanked" },
							{ find = "^Hunk %d+ of %d+$" },
							{ find = "%d+L, %d+B$" },
							{ find = "^[/?].*" }, -- Searching up/down
							{ find = "E486: Pattern not found:" }, -- Searcing not found
							{ find = "%d+ changes?;" }, -- Undoing/redoing
							{ find = "%d+ fewer lines" }, -- Deleting multiple lines
							{ find = "%d+ more lines" }, -- Undoing deletion of multiple lines
							{ find = "%d+ lines " }, -- Performing some other verb on multiple lines
							{ find = '"[^"]+" %d+L, %d+B' }, -- Saving

							-- Save
							{ find = " bytes written" },

							-- Redo/Undo
							{ find = " changes; before #" },
							{ find = " changes; after #" },
							{ find = "1 change; before #" },
							{ find = "1 change; after #" },

							-- Yank
							{ find = " lines yanked" },

							-- Move lines
							{ find = " lines moved" },
							{ find = " lines indented" },

							-- Bulk edit
							{ find = " fewer lines" },
							{ find = " more lines" },
							{ find = "1 more line" },
							{ find = "1 line less" },

							-- General messages
							{ find = "Already at newest change" }, -- Redoing
							{ find = "Already at oldest change" },
						},
					},
					opts = { skip = true },
				},
				{
					filter = {
						event = "notify",
						find = "No information available",
					},
					opts = { skip = true },
				},
			},
			timeout = 5000,
			render = "minimal",
			stages = "fade_in_slide_out",
			on_open = function(win)
				vim.api.nvim_win_set_config(win, { focusable = false })
			end,
		})

		vim.keymap.set({ "n", "i", "s" }, "<c-f>", function()
			if not require("noice.lsp").scroll(4) then
				return "<c-f>"
			end
		end, { silent = true, expr = true })

		vim.keymap.set({ "n", "i", "s" }, "<c-b>", function()
			if not require("noice.lsp").scroll(-4) then
				return "<c-b>"
			end
		end, { silent = true, expr = true })

		vim.keymap.set("n", "<Esc>", function()
			require("noice").cmd("dismiss")
		end, { desc = "[Noice] dismiss notify popup" })
	end,
}
