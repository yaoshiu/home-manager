return {
	spec = { "https://github.com/windwp/nvim-autopairs" },
	config = function()
		require("nvim-autopairs").setup({
			map_cr = true,
		})
	end,
}
