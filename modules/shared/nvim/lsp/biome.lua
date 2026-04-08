return {
	cmd = { "biome", "lsp-proxy" },
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

		-- Root marker files
		local root_markers = {
			"package-lock.json",
			"yarn.lock",
			"pnpm-lock.yaml",
			"bun.lockb",
			"bun.lock",
			"deno.lock",
			".git",
		}

		-- Biome config files
		local biome_files = { "biome.json", "biome.jsonc" }

		-- Search upward from current file for either biome config or root markers
		local found_root = vim.fs.find(
			vim.list_extend(biome_files, root_markers),
			{ path = filename, upward = true, type = "file" }
		)[1]

		if not found_root then
			-- fallback to cwd
			on_dir(vim.fn.getcwd())
			return
		end

		local project_root = vim.fs.dirname(found_root)

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
