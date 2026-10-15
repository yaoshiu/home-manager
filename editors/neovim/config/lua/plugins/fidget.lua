require("core.pack").add({
	{
		src = "https://github.com/j-hui/fidget.nvim",
		data = {
			config = function()
				require("fidget").setup({})
			end,
		},
	},
})
