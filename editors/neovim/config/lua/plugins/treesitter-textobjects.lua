require("core.pack").add({
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
		data = {
			config = function()
				vim.g.no_plugin_maps = true
				local keymaps = require("core.keymaps")
				local select = require("nvim-treesitter-textobjects.select")
				keymaps.add({
					{
						mode = { "x", "o" },
						"af",
						function()
							select.select_textobject("@function.outer", "textobjects")
						end,
					},
					{
						mode = { "x", "o" },
						"if",
						function()
							select.select_textobject("@function.inner", "textobjects")
						end,
					},
					{
						mode = { "x", "o" },
						"at",
						function()
							select.select_textobject("@class.outer", "textobjects")
						end,
					},
					{
						mode = { "x", "o" },
						"it",
						function()
							select.select_textobject("@class.inner", "textobjects")
						end,
					},
				})
			end,
		},
	},
})
