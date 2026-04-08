return {
	cmd = { "yaml-language-server", "--stdio" },
	filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab", "yaml.helm-values" },
	root_markers = { ".git" },
	settings = {
		redhat = {
			telemetry = {
				enabled = false,
			},
		},
		yaml = {
			schemaStore = {
				enable = true,
				url = "https://www.schemastore.org/api/json/catalog.json",
			},
			schemas = {
				kubernetes = "*.k8s.yaml",

        -- Docker Compose
				["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = {
					"*docker-compose*.{yml,yaml}",
					"*compose*.{yml,yaml}",
				},

        -- Github
				["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
				["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",

        -- Prettier
				["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",

        -- Kustomization
				["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",

        -- Ansible
				["https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible.json#/$defs/playbook"] = "*play*.{yml,yaml}",
				-- ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",

        -- Helm Chart
				["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",

        -- Dependabot
				["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",

        -- GitLab CI
				["https://json.schemastore.org/gitlab-ci"] = "*gitlab-ci*.{yml,yaml}",

        -- OpenAPI
				["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",

        -- Argo Workflow
				["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",
			},
		},
	},
}
