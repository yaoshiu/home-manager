return {
	spec = { "https://github.com/maxmx03/solarized.nvim" },
	config = function()
		require("solarized").setup({})
		vim.cmd.colorscheme("solarized")
	end,
}
