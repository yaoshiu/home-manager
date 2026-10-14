require("core.pack").add({
	{
		src = "https://github.com/ray-x/lsp_signature.nvim",
		data = {
			config = function()
				require("lsp_signature").setup({})
			end,
		},
	},
})
