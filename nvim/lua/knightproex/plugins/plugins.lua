return {
	"nvim-lua/plenary.nvim",
	"christoomey/vim-tmux-navigator",

	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			local catppuccin = require("catppuccin")
			catppuccin.setup({
				integrations = {
					noice = true,
					notify = true,
					which_key = true,
					alpha = true,
					lsp_trouble = true,
					nvim_surround = true,
					mason = true,
					indent_blankline = {
						enabled = true,
						scope_color = "lavender",
						colored_indent_levels = true,
					},
				},
			})
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},

	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")

			dashboard.section.header.val = {
				"                                                     ",
				"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
				"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
				"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
				"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
				"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
				"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
				"                                                     ",
			}
			dashboard.section.buttons.val = {
				dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
				dashboard.button("SPC ee", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
				dashboard.button("SPC ff", "󰱼 > Find File", "<cmd>Telescope find_files<CR>"),
				dashboard.button("SPC fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
				dashboard.button("q", " > Quit NVIM", "<cmd>qa<CR>"),
			}
			alpha.setup(dashboard.opts)
			vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
		end,
	},

	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
	},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
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
			-- disable indentation on the first level
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
			local comment = require("Comment")

			local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

			comment.setup({
				pre_hook = ts_context_commentstring.create_pre_hook(),
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
			local auto_session = require("auto-session")
			local function change_nvim_tree_dir()
				local nvim_tree = require("nvim-tree")
				nvim_tree.change_dir(vim.fn.getcwd())
			end

			auto_session.setup({
				auto_session_suppress_dirs = { "~/", "~/Downloads", "~/Documents", "~/Desktop/" },
				post_restore_cmds = { change_nvim_tree_dir, "NvimTreeOpen" },
			})
		end,
	},
}
