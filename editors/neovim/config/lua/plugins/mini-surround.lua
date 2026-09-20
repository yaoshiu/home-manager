require("core.pack").add({ "https://github.com/nvim-mini/mini.surround" })

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
