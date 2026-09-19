return {
	spec = {
		"https://github.com/nvim-mini/mini.icons",
		"https://github.com/nvim-tree/nvim-web-devicons",
		"https://github.com/folke/which-key.nvim",
	},
	config = function()
		local wk = require("which-key")
		wk.setup()

		wk.add({
			{ "<leader>f", group = "Telescope" },
			{
				"<leader>?",
				function()
					wk.show({ global = false })
				end,
				desc = "Buffer local keymaps (which-key)",
			},
		})
	end,
}
