return {
	"mason-org/mason.nvim",
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")

		mason.setup()

		mason_lspconfig.setup({
			automatic_enable = {
				exclude = {
					-- "rust_analyzer",
				},
			},
			ensure_installed = {
				-- "ts_ls",
				-- "biome",
				-- "html",
				-- "cssls",
				-- "tailwindcss",
				-- "lua_ls",
				-- "emmet_ls",
				-- "dockerls",
				-- "yamlls",
				-- "rust_analyzer",
				-- "helm_ls",
				-- "terraformls",
				-- "bashls",
				-- "gopls",
				-- "pylsp",
				"prismals",
			},
		})
	end,
}
