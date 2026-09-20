require("core.pack").add({
	"https://github.com/nvim-tree/nvim-web-devicons",
	{ src = "https://github.com/akinsho/bufferline.nvim", version = vim.version.range("*") },
})

require("bufferline").setup({
	options = {
		diagnostics = "nvim_lsp",
		always_show_bufferline = false,
	},
})
