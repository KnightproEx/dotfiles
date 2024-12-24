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
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					treesitter = true,
					noice = true,
					notify = true,
					telescope = true,
					which_key = true,
					alpha = true,
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
		event = { "BufReadPre", "BufNewFile" },
		main = "ibl",
		config = function()
			require("ibl").setup()
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
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local lualine = require("lualine")
			local lazy_status = require("lazy.status")

			lualine.setup({
				options = {
					theme = "catppuccin",
					icons_enabled = true,
					component_separators = "|",
					section_separators = "",
				},
				sections = {
					lualine_c = {
						{ "filename", path = 1 },
					},
					lualine_x = {
						{
							lazy_status.updates,
							cond = lazy_status.has_updates,
							color = { fg = "#ff9e64" },
						},
						{ "filetype" },
					},
				},
			})
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
