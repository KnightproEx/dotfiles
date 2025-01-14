return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- local lualine = require("lualine")
		-- local lazy_status = require("lazy.status")

		local catppuccin = require("lualine.themes.catppuccin")

		-- lualine.setup({
		-- 	options = {
		-- 		theme = catppuccin,
		-- 		component_separators = "|",
		-- 		section_separators = "",
		-- 	},
		-- 	sections = {
		-- 		lualine_b = {
		-- 			"branch",
		-- 			"diff",
		-- 		},
		-- 		lualine_c = { "filename", "diagnostics" },
		-- 		lualine_x = {
		-- 			{
		-- 				lazy_status.updates,
		-- 				cond = lazy_status.has_updates,
		-- 				color = { fg = "#ff9e64" },
		-- 			},
		-- 			{ "filetype" },
		-- 			{
		-- 				function()
		-- 					local msg = "No Active Lsp"
		-- 					local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
		-- 					local clients = vim.lsp.get_clients()
		-- 					if next(clients) == nil then
		-- 						return msg
		-- 					end
		-- 					for _, client in ipairs(clients) do
		-- 						local filetypes = client.config.filetypes
		-- 						if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
		-- 							return client.name
		-- 						end
		-- 					end
		-- 					return msg
		-- 				end,
		-- 			},
		-- 		},
		-- 	},
		-- })
		local clients_lsp = function()
			local clients = vim.lsp.get_clients()
			if next(clients) == nil then
				return ""
			end

			local c = {}
			for _, client in pairs(clients) do
				table.insert(c, client.name)
			end
			return " " .. table.concat(c, "|")
		end

		local recording = function()
			local reg = vim.fn.reg_recording()
			if reg == "" then
				return ""
			end
			return "@recording " .. reg
		end

		local custom_catppuccin = require("lualine.themes.catppuccin")

		require("lualine").setup({
			options = {
				theme = custom_catppuccin,
				component_separators = "",
				section_separators = "",
				-- disabled_filetypes = { "alpha", "Outline", "NvimTree" },
			},
			sections = {
				lualine_b = {
					{
						"branch",
						icon = "",
						color = { fg = catppuccin.normal.b.fg },
					},
					{
						"diff",
						symbols = { added = " ", modified = " ", removed = " " },
					},
				},
				lualine_c = {
					{
						"filetype",
						colored = true,
						icon_only = true,
						icon = { align = "right" },
						padding = { left = 1 },
					},
					{
						"filename",
						symbols = {
							modified = "",
							readonly = "",
							-- modified = "●",
							-- readonly = "",
							-- alternate_file = "#",
							-- directory = "",
						},
						padding = {},
					},
					{
						"diagnostics",
						symbols = { error = " ", warn = " ", info = " ", hint = " " },
						update_in_insert = true,
					},
					{ recording, color = { fg = "#ff9e64" } },
				},
				lualine_x = {},
				lualine_y = { clients_lsp },
				lualine_z = { { "location", icon = "" } },
			},
		})
	end,
}
