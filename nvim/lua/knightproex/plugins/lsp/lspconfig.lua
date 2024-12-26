return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		-- "hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },

		{ "folke/neodev.nvim" },
		{ "saghen/blink.cmp" },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		-- local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local util = require("lspconfig.util")
		local keymap = vim.keymap

		vim.diagnostic.config({
			float = { border = "rounded" },
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }

				opts.desc = "Show LSP references"
				keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

				opts.desc = "Go to declaration"
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

				opts.desc = "Show LSP definitions"
				keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

				opts.desc = "Show LSP implementations"
				keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

				opts.desc = "Show LSP type definitions"
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

				opts.desc = "Show buffer diagnostics"
				keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

				opts.desc = "Go to previous diagnostic"
				keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

				opts.desc = "Go to next diagnostic"
				keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts)

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
			end,
		})

		-- local capabilities = cmp_nvim_lsp.default_capabilities()
		local capabilities = require("blink.cmp").get_lsp_capabilities()
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }

		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		lspconfig["nixd"].setup({
			settings = {
				nixd = {
					formatting = {
						command = { "nixfmt" },
					},
				},
			},
		})

		mason_lspconfig.setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
			["rust_analyzer"] = function()
				return true
			end,
			["biome"] = function()
				lspconfig["biome"].setup({
					root_dir = function(fname)
						return util.root_pattern("biome.json", "biome.jsonc")(fname)
							or util.find_package_json_ancestor(fname)
							or util.find_node_modules_ancestor(fname)
							or util.find_git_ancestor(fname)
					end,
				})
			end,
			["yamlls"] = function()
				lspconfig["yamlls"].setup({
					settings = {
						yaml = {
							schemas = {
								["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = {
									"**/docker-compose.yml",
									"**/docker-compose.yaml",
									"**/docker-compose.*.yml",
									"**/docker-compose.*.yaml",
									"**/compose.yml",
									"**/compose.yaml",
									"**/compose.*.yml",
									"**/compose.*.yaml",
								},
								["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
							},
						},
					},
				})
			end,
			["lua_ls"] = function()
				lspconfig["lua_ls"].setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
							completion = {
								callSnippet = "Replace",
							},
							telemetry = { enable = false },
						},
					},
				})
			end,
			["ts_ls"] = function()
				lspconfig["ts_ls"].setup({
					handlers = {
						["textDocument/publishDiagnostics"] = function(_, result, ctx, config)
							if result.diagnostics == nil then
								return
							end

							local idx = 1
							while idx <= #result.diagnostics do
								local entry = result.diagnostics[idx]
								local formatter = require("format-ts-errors")[entry.code]

								entry.message = formatter and formatter(entry.message) or entry.message

								if entry.code == 80001 then
									table.remove(result.diagnostics, idx)
								else
									idx = idx + 1
								end
							end

							vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
						end,
					},
				})
			end,
		})

		-- 	vim.g.rustaceanvim = {
		-- 		server = {
		-- 			on_attach = function(_, bufnr)
		-- 				-- vim.keymap.set("n", "<leader>a", function()
		-- 				-- 	vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
		-- 				-- 	-- or vim.lsp.buf.codeAction() if you don't want grouping.
		-- 				-- end, { silent = true, buffer = bufnr })
		-- 				-- vim.keymap.set("n", "K", function()
		-- 				-- 	vim.cmd.RustLsp({ "hover", "actions" })
		-- 				-- end, { silent = true, buffer = bufnr })
		-- 			end,
		-- 		},
		-- 	}
	end,
}
