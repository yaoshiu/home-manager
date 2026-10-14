require("core.pack").add({
	"https://github.com/nvim-mini/mini.icons",
	"https://github.com/nvim-tree/nvim-web-devicons",
	{
		src = "https://github.com/folke/which-key.nvim",
		data = {
			config = function()
				local keymaps = require("core.keymaps")
				keymaps.setup()

				keymaps.add({
					{
						"<leader>?",
						function()
							require("which-key").show({ global = false })
						end,
						desc = "Buffer local keymaps (which-key)",
					},
				})
			end,
		},
	},
})
