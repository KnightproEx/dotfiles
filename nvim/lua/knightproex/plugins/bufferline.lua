return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	config = function()
		local bufferline = require("bufferline")
		local mocha = require("catppuccin.palettes").get_palette("mocha")

		bufferline.setup({
			highlights = require("catppuccin.groups.integrations.bufferline").get({
				custom = {
					all = {
						fill = { bg = mocha.base },
					},
				},
			}),
			options = {
				-- custom_areas = {
				-- 	right = function()
				-- 		local result = {}
				-- 		local seve = vim.diagnostic.severity
				-- 		local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
				-- 		local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
				-- 		local info = #vim.diagnostic.get(0, { severity = seve.INFO })
				-- 		local hint = #vim.diagnostic.get(0, { severity = seve.HINT })
				-- 		local buf = vim.api.nvim_get_current_buf()
				-- 		local buf_modified = vim.api.nvim_buf_get_option(buf, "modified")
				-- 		local function modified()
				-- 			if buf_modified then
				-- 				return " ●"
				-- 			else
				-- 				-- return "%m"
				-- 				return ""
				-- 			end
				-- 		end
				-- 		local path = "%#WinBar1# " .. vim.fn.expand("%:.") .. modified()
				-- 		local filetype = vim.bo.filetype
				-- 		local icon, hl = require("nvim-web-devicons").get_icon_by_filetype(filetype, { default = true })
				--
				-- 		vim.cmd(string.format([[hi Winbar1 guifg=%s]], "#f5e0dc"))
				--
				-- 		table.insert(result, { text = icon, link = hl })
				-- 		table.insert(result, { text = path })
				-- 		if error ~= 0 then
				-- 			table.insert(result, { text = "  " .. error, link = "DiagnosticError" })
				-- 		end
				-- 		if warning ~= 0 then
				-- 			table.insert(result, { text = "  " .. warning, link = "DiagnosticWarn" })
				-- 		end
				-- 		if hint ~= 0 then
				-- 			table.insert(result, { text = "  " .. hint, link = "DiagnosticHint" })
				-- 		end
				-- 		if info ~= 0 then
				-- 			table.insert(result, { text = "  " .. info, link = "DiagnosticInfo" })
				-- 		end
				-- 		table.insert(result, { text = " " })
				-- 		return result
				-- 	end,
				-- },
				mode = "tabs",
				show_buffer_close_icons = false,
				show_duplicates_prefix = false,
				right_mouse_command = false,
				left_mouse_command = false,
				indicator = {
					style = "none",
				},
				max_name_length = 2000,
				tab_size = 0,
				name_formatter = function(--[[ buf ]])
					return vim.fn.expand("%:.")
				end,
				separator_style = "thick",
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						separator = "",
						highlight = "Directory",
					},
				},
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(_, _, diagnostics_dict, _)
					local s = " "
					for e, n in pairs(diagnostics_dict) do
						local sym = e == "error" and " " or (e == "warning" and " " or " ")
						s = s .. n .. sym
					end
					return s
				end,
			},
		})
	end,
}
