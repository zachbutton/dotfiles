return {
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		version = false, -- Never set this value to "*"! Never!
		opts = {
			build = "make BUILD_FROM_SOURCE=true",
			-- add any opts here
			-- this file can contain specific instructions for your project
			instructions_file = "AGENTS.md",
			-- for example
			provider = "openai",
			providers = {
				provider = "openai",
				openai = {
					endpoint = "https://api.openai.com/v1",
					model = "gpt-5.2", -- or codex model if available
				},
			},
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			"nvim-mini/mini.pick", -- for file_selector provider mini.pick
			"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
			"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
			"ibhagwan/fzf-lua", -- for file_selector provider fzf
			"stevearc/dressing.nvim", -- for input provider dressing
			"folke/snacks.nvim", -- for input provider snacks
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
			"zbirenbaum/copilot.lua", -- for providers='copilot'
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- required for Windows users
						use_absolute_path = true,
					},
				},
			},
			{
				-- Make sure to set this up properly if you have lazy=true
				'MeanderingProgrammer/render-markdown.nvim',
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
	},

	{
		"ThePrimeagen/99",
		config = function()
			local _99 = require("99")
			local cwd = vim.uv.cwd()
            local basename = vim.fs.basename(cwd)
			vim.fn.mkdir(cwd .. "/tmp", "p")

			_99.setup({
				provider = _99.OpenCodeProvider,
				model = 'openai/gpt-5.3-codex',
				logger = {
					level = _99.DEBUG,
					path = "/tmp/" .. basename .. ".99.debug",
					print_on_error = true,
				},
				md_files = {
					"AGENTS.md",
				},
			})

            -- Create your own short cuts for the different types of actions
			vim.keymap.set("n", "<leader>nf", function()
				_99.fill_in_function()
			end)
            -- take extra note that i have visual selection only in v mode
            -- technically whatever your last visual selection is, will be used
            -- so i have this set to visual mode so i dont screw up and use an
            -- old visual selection
            --
            -- likely ill add a mode check and assert on required visual mode
            -- so just prepare for it now
			vim.keymap.set("v", "<leader>nv", function()
				_99.visual()
			end)

            --- if you have a request you dont want to make any changes, just cancel it
			vim.keymap.set("v", "<leader>ns", function()
				_99.stop_all_requests()
			end)

            --- Example: Using rules + actions for custom behaviors
            --- Create a rule file like ~/.rules/debug.md that defines custom behavior.
            --- For instance, a "debug" rule could automatically add printf statements
            --- throughout a function to help debug its execution flow.
			vim.keymap.set("n", "<leader>np", function()
				_99.fill_in_function_prompt()
			end)
		end,
	},
}
