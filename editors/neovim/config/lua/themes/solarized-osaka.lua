require("core.pack").add({
	{
		src = "https://github.com/craftzdog/solarized-osaka.nvim",
		data = {
			config = function()
				require("solarized-osaka").setup({})
			end,
		},
	},
})
