return {
	spec = { "https://github.com/nvim-mini/mini.surround" },
	config = function()
		require("mini.surround").setup({
			mappings = {
				add = "ma",
				delete = "md",
				find = "mf",
				find_left = "mF",
				highlight = "mh",
				replace = "mr",
			},
		})
	end,
}
