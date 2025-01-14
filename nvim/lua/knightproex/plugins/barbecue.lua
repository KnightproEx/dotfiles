return {
	"utilyre/barbecue.nvim",
	name = "barbecue",
	version = "*",
	dependencies = {
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		attach_navic = false,
		show_modified = true,
		show_navic = false,
		-- custom_section = function()
		-- 	local result = {}
		-- 	local seve = vim.diagnostic.severity
		-- 	local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
		-- 	local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
		-- 	local info = #vim.diagnostic.get(0, { severity = seve.INFO })
		-- 	local hint = #vim.diagnostic.get(0, { severity = seve.HINT })
		--
		-- 	if error ~= 0 then
		-- 		table.insert(result, { "  " .. error, "DiagnosticError" })
		-- 	end
		-- 	if warning ~= 0 then
		-- 		table.insert(result, { "  " .. warning, "DiagnosticWarn" })
		-- 	end
		-- 	if hint ~= 0 then
		-- 		table.insert(result, { "  " .. hint, "DiagnosticHint" })
		-- 	end
		-- 	if info ~= 0 then
		-- 		table.insert(result, { "  " .. info, "DiagnosticInfo" })
		-- 	end
		--
		-- 	table.insert(result, { " " })
		--
		-- 	return result
		-- end,
	},
}
