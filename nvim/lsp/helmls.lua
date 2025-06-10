return {
	capabilities = {
		workspace = {
			didChangeWatchedFiles = {
				dynamicRegistration = true,
			},
		},
	},
	cmd = { "helm_ls", "serve" },
	filetypes = { "helm", "yaml.helm-values" },
	root_markers = { "Chart.yaml" },
	settings = {
		helm_ls = {
			yamlls = {
				enabled = false,
				path = "yaml-language-server",
			},
		},
	},
}
