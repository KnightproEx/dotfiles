vim.lsp.enable({
	"luals",
	"helmls",
	"dockerls",
	"yamlls",
	"tailwindcssls",
	"tsls",
	"emmetls",
	"terraformls",
	"bashls",
	"gopls",
	"cssls",
	"htmlls",
	"pylsp",
	"nixd",
	"biome",
})

vim.diagnostic.config({
	float = { border = "rounded" },
	jump = {
		float = true,
	},
	virtual_text = true,
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

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local opts = { buffer = ev.buf, silent = true }
		local keymap = vim.keymap

		opts.desc = "Show line diagnostics"
		keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

		opts.desc = "Restart LSP"
		keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
	end,
})

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
