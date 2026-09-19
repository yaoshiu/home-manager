return {
	spec = {
		"https://github.com/nvim-mini/mini.icons",
		"https://github.com/nvim-tree/nvim-web-devicons",
		"https://github.com/folke/which-key.nvim",
	},
	config = function()
		require("which-key").setup()
	end,
}
