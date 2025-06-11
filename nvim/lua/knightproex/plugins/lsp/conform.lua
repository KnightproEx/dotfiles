-- local function biome_lsp_or_prettier(bufnr)
-- 	local has_biome_lsp = vim.lsp.get_active_clients({
-- 		bufnr = bufnr,
-- 		name = "biome",
-- 	})[1]
-- 	if has_biome_lsp then
-- 		return {}
-- 	end
-- 	local has_prettier = vim.fs.find({
-- 		".prettierrc",
-- 		".prettierrc.json",
-- 		".prettierrc.yml",
-- 		".prettierrc.yaml",
-- 		".prettierrc.json5",
-- 		".prettierrc.js",
-- 		".prettierrc.cjs",
-- 		".prettierrc.toml",
-- 		"prettier.config.js",
-- 		"prettier.config.cjs",
-- 	}, { upward = true })[1]
-- 	if has_prettier then
-- 		return { "prettier" }
-- 	end
-- 	return { "biome" }
-- end

return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	---@class ConformOpts
	opts = {
		formatters = {
			biome = {
				command = "biome",
				args = {
					"check",
					"unsafe",
					"--formatter-enabled=true",
					"--organize-imports-enabled=true",
					"--write",
					"--skip-errors",
					"--stdin-file-path",
					"$FILENAME",
				},
			},
		},
		formatters_by_ft = {
			-- ["javascript"] = biome_lsp_or_prettier,
			-- ["javascriptreact"] = biome_lsp_or_prettier,
			-- ["typescript"] = biome_lsp_or_prettier,
			-- ["typescriptreact"] = biome_lsp_or_prettier,
			["javascript"] = { "biome" },
			["javascriptreact"] = { "biome" },
			["typescript"] = { "biome" },
			["typescriptreact"] = { "biome" },
			["json"] = { "biome" },
			["jsonc"] = { "biome" },
			["css"] = { "biome" },
			["scss"] = { "biome" },
			["less"] = { "biome" },
			["html"] = { "biome" },
			graphql = { "biome" },
			yaml = { "prettier" },
			markdown = { "prettier" },
			liquid = { "prettier" },
			lua = { "stylua" },
			php = { "pint" },
			sh = { "shfmt", "shellharden" },
		},
		format_on_save = {
			lsp_fallback = true,
			async = false,
			timeout_ms = 10000,
		},
	},
}
