return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local catppuccin = require("lualine.themes.catppuccin")

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
			return "⦿ recording " .. reg
		end

		require("lualine").setup({
			options = {
				theme = catppuccin,
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
				},
				lualine_c = {
					{
						"diff",
						source = function()
							local gitsigns = vim.b.gitsigns_status_dict
							if gitsigns then
								return {
									added = gitsigns.added,
									modified = gitsigns.changed,
									removed = gitsigns.removed,
								}
							end
						end,
						symbols = {
							added = " ",
							modified = " ",
							removed = " ",
						},
						colored = true,
						always_visible = false,
					},
					{
						"diagnostics",
						symbols = { error = " ", warn = " ", info = " ", hint = " " },
						update_in_insert = true,
					},
					{
						recording,
						color = { fg = "#fab387" },
						padding = { left = 2 },
					},
				},
				lualine_x = {
					{
						"filetype",
						colored = true,
					},
				},
				lualine_y = { clients_lsp },
				lualine_z = { { "location", icon = "" } },
			},
		})
	end,
}
