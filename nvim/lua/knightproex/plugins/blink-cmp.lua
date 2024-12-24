return {
	"saghen/blink.cmp",
	event = { "LspAttach" },
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
		},
		"rafamadriz/friendly-snippets",
	},
	version = "*",
	opts = {
		keymap = {
			preset = "none",
			["<A-space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "cancel", "fallback" },
			["<CR>"] = { "accept", "fallback" },

			["<Tab>"] = { "snippet_forward", "fallback" },
			["<S-Tab>"] = { "snippet_backward", "fallback" },

			["<C-p>"] = { "select_prev", "fallback" },
			["<C-n>"] = { "select_next", "fallback" },
			["<C-k>"] = { "select_prev", "fallback" },
			["<C-j>"] = { "select_next", "fallback" },

			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },
		},
		snippets = {
			expand = function(snippet)
				require("luasnip").lsp_expand(snippet)
			end,
			active = function(filter)
				if filter and filter.direction then
					return require("luasnip").jumpable(filter.direction)
				end
				return require("luasnip").in_snippet()
			end,
			jump = function(direction)
				require("luasnip").jump(direction)
			end,
		},
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		completion = {
			list = {
				selection = "auto_insert",
			},
			menu = {
				border = "single",
				auto_show = function(ctx)
					return ctx.mode ~= "cmdline"
				end,
			},
			documentation = { window = { border = "single" } },
		},
		signature = { enabled = true, window = { border = "single" } },
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
	},
	opts_extend = { "sources.default" },
}
