return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup()

		mason_lspconfig.setup({
			ensure_installed = {
				"ts_ls",
				"biome",
				"html",
				"cssls",
				"tailwindcss",
				"lua_ls",
				"emmet_ls",
				"prismals",
				"intelephense",
				"dockerls",
				"yamlls",
				"rust_analyzer",
				"helm_ls",
				"terraformls",
				"bashls",
				"pylsp",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier",
				"stylua",
				-- "php-cs-fixer",
				"pint",
				"tflint",
				-- "eslint_d",
				"shfmt",
			},
		})
	end,
}
