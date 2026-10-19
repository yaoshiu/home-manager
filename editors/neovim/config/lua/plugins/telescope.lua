require("core.pack").add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	{
		data = {
			build = { "make" },
		},
		src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
	},
	"https://github.com/nvim-telescope/telescope-ui-select.nvim",
	{
		src = "https://github.com/nvim-telescope/telescope.nvim",
		version = vim.version.range("*"),
		data = {
			config = function()
				local builtin = require("telescope.builtin")
				local telescope = require("telescope")
				telescope.load_extension("fzf")
				telescope.load_extension("ui-select")

				local keymaps = require("core.keymaps")
				keymaps.add({ { "<leader>f", group = "Telescope" } })
				keymaps.add({
					{ "<leader>ff", builtin.find_files, desc = "Telescope find files" },
					{ "<leader>fg", builtin.git_files, desc = "Telescope git files" },
					{ "<leader>fk", builtin.keymaps, desc = "Telescope keymaps" },
					{ "<leader>fr", builtin.live_grep, desc = "Telescope live grep" },
					{ "<leader>fd", builtin.diagnostics, desc = "Telescope diagnostics" },
				})
				vim.api.nvim_create_autocmd("LspAttach", {
					callback = function(event)
						keymaps.add({
							{ "gd", builtin.lsp_definitions, desc = "Go to definitions", buffer = event.buf },
							{ "gR", builtin.lsp_references, desc = "Go to references", buffer = event.buf },
							{ "gD", builtin.lsp_type_definitions, desc = "Go to type definitions", buffer = event.buf },
							{ "gI", builtin.lsp_implementations, desc = "Go to implementations", buffer = event.buf },
						})
					end,
				})
			end,
		},
	},
})
