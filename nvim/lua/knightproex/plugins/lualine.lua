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

		local recording_text = function()
			local reg = vim.fn.reg_recording()
			if reg == "" then
				return ""
			end
			return "⦿ recording " .. reg
		end

		local recording = {
			recording_text,
			color = { fg = "#fab387" },
			padding = { left = 2 },
		}

		local branch = {
			"branch",
			icon = "",
			color = { fg = catppuccin.normal.b.fg },
		}

		local filename = {
			"filename",
			symbols = {
				modified = "[+]",
				readonly = "[-]",
				unnamed = "[No Name]",
				newfile = "[New]",
			},
			-- padding = { left = 0, right = 1 },
		}

		local diff = {
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
		}

		local diagnostics = {
			"diagnostics",
			symbols = { error = " ", warn = " ", info = " ", hint = " " },
			update_in_insert = true,
		}

		local filetype = {
			"filetype",
			colored = true,
		}

		-- local fileicon = {
		-- 	"filetype",
		-- 	colored = true,
		-- 	icon_only = true,
		-- 	padding = { left = 2, right = 0 },
		-- }

		local location = { "location", icon = "" }

		require("lualine").setup({
			options = {
				theme = catppuccin,
				component_separators = "",
				section_separators = "",
				-- disabled_filetypes = { "alpha", "Outline", "NvimTree" },
				disabled_filetypes = { "snacks_layout_box" },
			},
			sections = {
				lualine_b = { branch },
				-- lualine_c = { fileicon, filename, diff, diagnostics, recording },
				lualine_c = { filename, recording },
				-- lualine_x = { filetype },
				lualine_x = { diff, diagnostics, filetype },
				-- lualine_y = { clients_lsp },
				-- lualine_z = { location },
				lualine_y = {},
				lualine_z = {},
			},
			inactive_sections = {
				-- lualine_c = { fileicon, filename, diff, diagnostics },
				lualine_c = { filename },
				-- lualine_x = { filetype },
				lualine_x = { diff, diagnostics, filetype },
				-- lualine_y = { clients_lsp },
				-- lualine_z = { location },
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
