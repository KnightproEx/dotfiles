return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	config = function()
		local bufferline = require("bufferline")

		bufferline.setup({
			highlights = require("catppuccin.groups.integrations.bufferline").get(),
			options = {
				-- custom_areas = {
				-- 	left = function()
				-- 		local result = {}
				-- 		local seve = vim.diagnostic.severity
				-- 		local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
				-- 		local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
				-- 		local info = #vim.diagnostic.get(0, { severity = seve.INFO })
				-- 		local hint = #vim.diagnostic.get(0, { severity = seve.HINT })
				-- 		local path = "  " .. vim.fn.expand("%:.")
				--
				-- 		table.insert(result, { text = path })
				--
				-- 		if error ~= 0 then
				-- 			table.insert(result, { text = "  " .. error, link = "DiagnosticError" })
				-- 		end
				--
				-- 		if warning ~= 0 then
				-- 			table.insert(result, { text = "  " .. warning, link = "DiagnosticWarn" })
				-- 		end
				--
				-- 		if hint ~= 0 then
				-- 			table.insert(result, { text = "  " .. hint, link = "DiagnosticHint" })
				-- 		end
				--
				-- 		if info ~= 0 then
				-- 			table.insert(result, { text = "  " .. info, link = "DiagnosticInfo" })
				-- 		end
				-- 		return result
				-- 	end,
				-- },
				mode = "tabs",
				separator_style = "slant",
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
