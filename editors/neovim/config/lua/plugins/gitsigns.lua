require("core.pack").add({
	{
		src = "https://github.com/lewis6991/gitsigns.nvim",
		data = {
			config = function()
				local gitsigns = require("gitsigns")
				local keymaps = require("core.keymaps")
				gitsigns.setup({
					on_attach = function(bufnr)
						keymaps.add({
							"]c",
							function()
								if vim.wo.diff then
									vim.cmd.normal({ "]c", bang = true })
								else
									gitsigns.nav_hunk("next")
								end
							end,
							mode = "n",
							desc = "Next change",
							buffer = bufnr,
						})

						keymaps.add({
							"[c",
							function()
								if vim.wo.diff then
									vim.cmd.normal({ "[c", bang = true })
								else
									gitsigns.nav_hunk("prev")
								end
							end,
							mode = "n",
							desc = "Prev chang",
							buffer = bufnr,
						})
					end,
				})
			end,
		},
	},
})
