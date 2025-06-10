return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim" },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local util = require("lspconfig.util")
		local keymap = vim.keymap

		vim.diagnostic.config({
			float = { border = "rounded" },
			jump = {
				float = true,
			},
			virtual_text = true,
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }

				-- opts.desc = "Show LSP references"
				-- keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
				--
				-- opts.desc = "Go to declaration"
				-- keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				--
				-- opts.desc = "Show LSP definitions"
				-- keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
				--
				-- opts.desc = "Show LSP implementations"
				-- keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
				--
				-- opts.desc = "Show LSP type definitions"
				-- keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

				-- opts.desc = "Show buffer diagnostics"
				-- keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

				-- opts.desc = "Go to previous diagnostic"
				-- keymap.set("n", "[d", function()
				-- 	vim.diagnostic.jump({ count = -1, float = true })
				-- end, opts)
				--
				-- opts.desc = "Go to next diagnostic"
				-- keymap.set("n", "]d", function()
				-- 	vim.diagnostic.jump({ count = 1, float = true })
				-- end, opts)

				-- opts.desc = "Show documentation for what is under cursor"
				-- keymap.set("n", "K", vim.lsp.buf.hover, opts)

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
			end,
		})

		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.INFO] = " ",
					[vim.diagnostic.severity.HINT] = "󰌵 ",
				},
				numhl = {
					[vim.diagnostic.severity.ERROR] = "",
					[vim.diagnostic.severity.WARN] = "",
					[vim.diagnostic.severity.HINT] = "",
					[vim.diagnostic.severity.INFO] = "",
				},
			},
		})

		lspconfig.ts_ls.setup({})
		lspconfig.lua_ls.setup({})
		lspconfig.terraformls.setup({})
		lspconfig.emmet_ls.setup({})
		lspconfig.bashls.setup({})
		lspconfig.gopls.setup({})
		lspconfig.tailwindcss.setup({})

		lspconfig.nixd.setup({
			settings = {
				nixpkgs = {
					expr = "import <nixpkgs> { }",
				},
				nixd = {
					formatting = {
						command = { "nixfmt" },
					},
				},
				options = {
					nixos = {
						expr = '(builtins.getFlake ("git+file://" + toString ./.)).nixosConfigurations.bh-mac.options',
					},
					home_manager = {
						-- expr = '(builtins.getFlake ("git+file://" + toString ./.)).homeConfigurations.bh@bh-mac.options',
						-- expr = "(builtins.getFlake (builtins.toString ./.)).darwinConfigurations.bh-mac.options.home-manager.users.type.getSubOptions []",
						expr = '(builtins.getFlake ("git+file://" + toString ./.)).darwinConfigurations.bh-mac.options.home-manager.users.type.getSubOptions []',
					},
					nix_darwin = {
						expr = '(builtins.getFlake ("git+file://" + toString ./.)).darwinConfigurations.bh-mac.options',
					},
				},
			},
		})

		-- Terraform format on save
		vim.api.nvim_create_autocmd({ "BufWritePre" }, {
			pattern = { "*.tf", "*.tfvars" },
			callback = function()
				vim.lsp.buf.format()
			end,
		})

		vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
			pattern = "deployment.yaml",
			callback = function()
				vim.opt_local.filetype = "helm"
			end,
		})

		lspconfig.helm_ls.setup({
			settings = {
				helm_ls = {
					yamlls = {
						enabled = false,
						path = "yaml-language-server",
					},
				},
			},
		})

		lspconfig.biome.setup({
			root_dir = function(fname)
				return util.root_pattern("biome.json", "biome.jsonc")(fname)
					or util.find_package_json_ancestor(fname)
					or util.find_node_modules_ancestor(fname)
					or util.find_git_ancestor(fname)
			end,
			-- root_dir = function(bufnr, on_dir)
			-- 	local fname = vim.api.nvim_buf_get_name(bufnr)
			-- 	local root_files = { "biome.json", "biome.jsonc" }
			-- 	root_files = util.insert_package_json(root_files, "biome", fname)
			-- 	local root_dir = vim.fs.dirname(vim.fs.find(root_files, { path = fname, upward = true })[1])
			-- 	on_dir(root_dir)
			-- end,
		})

		lspconfig.yamlls.setup({
			settings = {
				yaml = {
					schemaStore = {
						enable = true,
						url = "https://www.schemastore.org/api/json/catalog.json",
					},
					schemas = {
						["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = {
							"*docker-compose*.{yml,yaml}",
							"*compose*.{yml,yaml}",
						},
						kubernetes = "*.k8s.yaml",
						["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
						["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
						["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
						["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
						["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
						["http://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
						["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
						["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
						["https://json.schemastore.org/gitlab-ci"] = "*gitlab-ci*.{yml,yaml}",
						["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
						["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",
					},
				},
			},
		})

		vim.lsp.config("lua_ls", {
			on_init = function(client)
				if client.workspace_folders then
					local path = client.workspace_folders[1].name
					if
						path ~= vim.fn.stdpath("config")
						and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
					then
						return
					end
				end

				client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
					runtime = {
						-- Tell the language server which version of Lua you're using (most
						-- likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
						-- Tell the language server how to find Lua modules same way as Neovim
						-- (see `:h lua-module-load`)
						path = {
							"lua/?.lua",
							"lua/?/init.lua",
						},
					},
					-- Make the server aware of Neovim runtime files
					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME,
							-- Depending on the usage, you might want to add additional paths
							-- here.
							"${3rd}/luv/library",
							-- '${3rd}/busted/library'
						},
						-- Or pull in all of 'runtimepath'.
						-- NOTE: this is a lot slower and will cause issues when working on
						-- your own configuration.
						-- See https://github.com/neovim/nvim-lspconfig/issues/3189
						-- library = {
						--   vim.api.nvim_get_runtime_file('', true),
						-- }
					},
				})
			end,
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

		vim.g.rustaceanvim = {
			tools = {
				float_win_config = {
					border = "rounded",
				},
			},
			server = {
				on_attach = function(_, bufnr)
					-- vim.keymap.set("n", "<leader>a", function()
					-- 	vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
					-- 	-- or vim.lsp.buf.codeAction() if you don't want grouping.
					-- end, { silent = true, buffer = bufnr })
					vim.keymap.set("n", "K", function()
						vim.cmd.RustLsp({ "hover", "actions" })
					end, { silent = true, buffer = bufnr })
				end,
			},
		}
	end,
}
