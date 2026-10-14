require("core.pack").add({
	{
		src = "https://github.com/windwp/nvim-ts-autotag",
		data = {
			config = function()
				require("nvim-ts-autotag").setup()
			end,
		},
	},
})
