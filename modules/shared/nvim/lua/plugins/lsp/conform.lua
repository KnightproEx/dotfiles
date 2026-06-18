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
					"--unsafe",
					"--formatter-enabled=true",
					"--linter-enabled=true",
					"--write",
					"--stdin-file-path",
					"$FILENAME",
				},
			},
		},
		formatters_by_ft = {
			["json"] = { "biome" },
			-- ["jsonc"] = { "biome" },
			-- ["css"] = { "biome" },
			-- ["scss"] = { "biome" },
			-- ["less"] = { "biome" },
			-- ["html"] = { "biome" },
			-- graphql = { "biome" },
			-- yaml = { "prettier" },
			javascript = { "biome", "biome-organize-imports" },
			javascriptreact = { "biome", "biome-organize-imports" },
			typescript = { "biome", "biome-organize-imports" },
			typescriptreact = { "biome", "biome-organize-imports" },
			markdown = { "prettier" },
			liquid = { "prettier" },
			lua = { "stylua" },
			sh = { "shfmt", "shellharden" },
			bash = { "shfmt", "shellharden" },
		},
		format_on_save = {
			lsp_fallback = true,
			async = false,
			timeout_ms = 10000,
		},
	},
}
