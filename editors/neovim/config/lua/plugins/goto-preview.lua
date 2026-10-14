require("core.pack").add({
	"https://github.com/rmagatti/logger.nvim",
	{
		src = "https://github.com/rmagatti/goto-preview",
		data = {
			config = function()
				require("goto-preview").setup({})
			end,
		},
	},
})
