local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

return {
	capabilities = capabilities,
	cmd = { "vscode-css-language-server", "--stdio" },
	filetypes = { "css", "scss", "less" },
	init_options = { provideFormatter = true }, -- needed to enable formatting capabilities
	root_markers = { "package.json", ".git" },
	settings = {
		css = { validate = true },
		scss = { validate = true },
		less = { validate = true },
	},
}
