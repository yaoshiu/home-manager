require("core.pack").add({
	{
		src = "https://github.com/stevearc/overseer.nvim",
		data = {
			config = function()
				require("overseer").setup()

				require("core.keymaps").add({
					{ "<leader>or", "<cmd>OverseerRun<CR>", desc = "Overseer run" },
					{ "<leader>ot", "<cmd>OverseerToggle<CR>", desc = "Overseer toggle" },
				})
			end,
		},
	},
})
