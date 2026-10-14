require("core.pack").add({
	{
		src = "https://github.com/windwp/nvim-autopairs",
		data = {
			config = function()
				require("nvim-autopairs").setup({
					map_cr = true,
				})
			end,
		},
	},
})
