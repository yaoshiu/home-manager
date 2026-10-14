require("core.pack").add({
	{
		src = "https://github.com/lukas-reineke/indent-blankline.nvim",
		data = {
			config = function()
				require("ibl").setup()
			end,
		},
	},
})
