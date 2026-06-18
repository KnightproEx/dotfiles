return {
	cmd = function(dispatchers, config)
		local cmd = "biome"
		if (config or {}).root_dir then
			local local_cmd = vim.fs.joinpath(config.root_dir, "node_modules/.bin", cmd)
			if vim.fn.executable(local_cmd) == 1 then
				cmd = local_cmd
			end
		end
		return vim.lsp.rpc.start({ cmd, "lsp-proxy" }, dispatchers)
	end,
	filetypes = {
		"astro",
		"css",
		"graphql",
		"javascript",
		"javascriptreact",
		"json",
		"jsonc",
		"svelte",
		"typescript",
		"typescript.tsx",
		"typescriptreact",
		"vue",
	},
	workspace_required = true,
	root_dir = function(bufnr, on_dir)
		local filename = vim.api.nvim_buf_get_name(bufnr)

		-- Biome config files
		local biome_files = { "biome.json", "biome.jsonc" }
		local root_markers = {
			"package-lock.json",
			"yarn.lock",
			"pnpm-lock.yaml",
			"bun.lockb",
			"bun.lock",
			"deno.lock",
		}
		-- Set a lower priority to avoid spawning multiple servers on monorepos
		local biome_config_files = { "biome.json", "biome.jsonc" }
		-- Give the root markers equal priority by wrapping them in a table
		root_markers = vim.fn.has("nvim-0.11.3") == 1 and { root_markers, biome_config_files, { ".git" } }
			or vim.list_extend(root_markers, vim.list_extend(biome_config_files, { ".git" }))

		local project_root = vim.fs.root(bufnr, root_markers) or vim.fn.getcwd()

		-- Ensure the buffer is actually using Biome
		local biome_used = vim.fs.find(biome_files, {
			path = filename,
			upward = true,
			type = "file",
			limit = 1,
			stop = project_root,
		})[1]

		if not biome_used then
			return
		end

		on_dir(project_root)
	end,
}
