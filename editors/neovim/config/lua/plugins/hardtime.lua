require("core.pack").add({
	"https://github.com/MunifTanjim/nui.nvim",
	{
		src = "https://github.com/m4xshen/hardtime.nvim",
		data = {
			config = function()
				require("hardtime").setup({})
			end,
		},
	},
})
