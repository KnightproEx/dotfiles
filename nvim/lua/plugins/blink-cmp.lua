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
			["<CR>"] = { "select_and_accept", "fallback" },

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
			nerd_font_variant = "mono",
		},
		completion = {
			trigger = { show_on_accept_on_trigger_character = false },
			menu = {
				border = "rounded",
				auto_show = function(ctx)
					return ctx.mode ~= "cmdline"
				end,
				winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
				draw = {
					treesitter = { "lsp" },
					columns = {
						{ "kind_icon", "label", gap = 1 },
					},
					components = {
						label = {
							text = function(ctx)
								return require("colorful-menu").blink_components_text(ctx)
							end,
							highlight = function(ctx)
								return require("colorful-menu").blink_components_highlight(ctx)
							end,
						},
					},
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 0,
				window = {
					border = "rounded",
					winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
				},
			},
		},
		cmdline = {
			keymap = {
				preset = "none",
				["<A-space>"] = { "show", "show_documentation", "hide_documentation" },
				["<C-e>"] = { "cancel", "fallback" },
				["<CR>"] = { "select_and_accept", "fallback" },

				["<Tab>"] = { "show", "select_next", "fallback" },
				["<S-Tab>"] = { "snippet_backward", "fallback" },

				["<C-p>"] = { "select_prev", "fallback" },
				["<C-n>"] = { "select_next", "fallback" },
				["<C-k>"] = { "select_prev", "fallback" },
				["<C-j>"] = { "select_next", "fallback" },

				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },
			},
			completion = {
				ghost_text = { enabled = false },
			},
		},
		signature = { enabled = false },
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
