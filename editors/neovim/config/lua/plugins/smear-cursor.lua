require("core.pack").add({
	{
		src = "https://github.com/sphamba/smear-cursor.nvim",
		data = {
			config = function()
				require("smear_cursor").setup({})
			end,
		},
	},
})
