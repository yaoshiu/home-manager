require("core.pack").add({
	"https://github.com/nvim-tree/nvim-web-devicons",
	{
		src = "https://github.com/nvim-lualine/lualine.nvim",
		data = {
			config = function()
				require("lualine").setup({
					options = {
						component_separators = { left = "|", right = "|" },
						section_separators = { left = "", right = "" },
					},
				})
			end,
		},
	},
})
