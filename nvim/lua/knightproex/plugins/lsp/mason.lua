return {
	"mason-org/mason.nvim",
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

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
				"prismals",
				"intelephense",
				-- "dockerls",
				-- "yamlls",
				-- "rust_analyzer",
				-- "helm_ls",
				-- "terraformls",
				-- "bashls",
				"pylsp",
				-- "gopls",
				"sqlls",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				-- "prettier",
				-- "stylua",
				-- "php-cs-fixer",
				"pint",
				-- "tflint",
				-- "eslint_d",
				-- "shfmt",
				-- "shellharden",
			},
		})
	end,
}
