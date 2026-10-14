require("core.pack").add({
	"https://github.com/antoinemadec/FixCursorHold.nvim",
	"https://github.com/nvim-neotest/nvim-nio",
	{
		src = "https://github.com/nvim-neotest/neotest",
		data = {
			config = function()
				require("core.neotest").setup()
			end,
		},
	},
})
