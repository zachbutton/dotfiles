return {
	{
		'projekt0n/github-nvim-theme',
		name = 'github-theme',
		config = function()
			vim.cmd([[colorscheme github_dark_default]])
		end,
	},

	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = {}
	},

	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")

			-- REQUIRED
			harpoon:setup({
				settings = {
					save_on_toggle = true,
					sync_on_ui_close = true
				}
			})
			-- REQUIRED

			vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
			vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

			vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
			vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
			vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
			vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)
		end
	},

	{ "folke/which-key.nvim", opts = {} },

	{
		"mikavilpas/yazi.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim", lazy = true },
		},
		keys = {
			{
				"<leader>-",
				mode = { "n", "v" },
				"<cmd>Yazi<cr>",
				desc = "Open yazi at the current file",
			},
		}
	},

	{
		"folke/snacks.nvim",
		---@type snacks.Config
		opts = {
			picker = {
				-- your picker configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		},
		keys = {
			{ "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },		
			{ "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },

			{ "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
			{ "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
			{ "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
			{ "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
			{ "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
			{ "gai", function() Snacks.picker.lsp_incoming_calls() end, desc = "C[a]lls Incoming" },
			{ "gao", function() Snacks.picker.lsp_outgoing_calls() end, desc = "C[a]lls Outgoing" },
			{ "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
			{ "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
		}
	},

	{
		url = "https://codeberg.org/andyg/leap.nvim.git",
		config = function()
			vim.keymap.set({'n', 'x', 'o'}, '<leader>t', '<Plug>(leap)')
			vim.keymap.set('n',						 '<C-w>t', '<Plug>(leap-from-window)')			
		end
	},

	{
		'akinsho/toggleterm.nvim', 
		version = "*", 
		config = function()
			local toggleterm = require("toggleterm")
			toggleterm.setup({
				highlights = {
					-- highlights which map to a highlight group name and a table of it's values
					-- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
					Normal = {
						guibg = "#FF0000",
					},
					NormalFloat = {
						link = 'Normal'
					},
					FloatBorder = {
						guifg = "#778899",
					},
				},
				shade_terminals = true,
				shading_factor = 30,
				shading_ratio = -3,
				float_opts = {
					border = 'rounded'
				}
			})
			
			local Terminal  = require('toggleterm.terminal').Terminal
			local full = Terminal:new({ 
				cmd = "zsh -c 'export TERM=xterm; echo -e \"\\e[33m\"; read; jjui'", 
				hidden = true,
				direction = "float"
			})
			local peek = Terminal:new({ 
				cmd = "jjui", 
				hidden = true,
			})

			function _full()
			  full:toggle()
			end
			function _peek()
			  peek:toggle()
			end

			vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua _full()<CR>", {noremap = true, silent = true})
			vim.api.nvim_set_keymap("n", "<leader>gp", "<cmd>lua _peek()<CR>", {noremap = true, silent = true})
		end
	},
}
