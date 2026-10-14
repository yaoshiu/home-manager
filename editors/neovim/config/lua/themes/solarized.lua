require("core.pack").add({
	{
		src = "https://github.com/maxmx03/solarized.nvim",
		data = {
			config = function()
				require("solarized").setup({})

				vim.cmd.colorscheme("solarized")
			end,
		},
	},
})
