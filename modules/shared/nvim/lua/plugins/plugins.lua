return {
	"nvim-lua/plenary.nvim",
	"christoomey/vim-tmux-navigator",

	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
	},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
	},

  {
    'nvim-mini/mini.icons',
    version = "*",
  },

	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = true,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function()
			require("ibl").setup({
				indent = {
					char = "▏",
				},
				scope = {
					show_start = false,
					show_end = false,
				},
			})
			local hooks = require("ibl.hooks")
			hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
			hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_tab_indent_level)
		end,
	},

	{
		"numToStr/Comment.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},

	{
		"windwp/nvim-autopairs",
		event = { "InsertEnter" },
		-- dependencies = {
		-- 	"saghen/blink.cmp",
		-- },
		config = function()
			local autopairs = require("nvim-autopairs")

			autopairs.setup({
				check_ts = true,
				ts_config = {
					lua = { "string" },
					javascript = { "template_string" },
				},
			})

			-- local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			-- local cmp = require("cmp")
			--
			-- cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},

	{
		"rmagatti/auto-session",
		config = function()
			require("auto-session").setup({
				suppressed_dirs = { "~/", "~/Downloads", "~/Documents", "~/Desktop/" },
			})
		end,
	},
}
