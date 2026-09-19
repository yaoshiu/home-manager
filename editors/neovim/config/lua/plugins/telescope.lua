return {
	spec = {
		"https://github.com/nvim-lua/plenary.nvim",
		"https://github.com/nvim-tree/nvim-web-devicons",
		{
			src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
			data = {
				build = { "make" },
			},
		},
		{ src = "https://github.com/nvim-telescope/telescope.nvim", version = vim.version.range("*") },
	},
	config = function()
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader><leader>", builtin.git_files, { desc = "Telescope git files" })
		vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Telescope find keymaps" })
		vim.keymap.set("n", "<leader>fr", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Telescope diagnostics" })
		vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "Go to definitioins" })
		vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "Go to references" })
		vim.keymap.set("n", "gD", builtin.lsp_type_definitions, { desc = "Go to type definitions" })
	end,
}
