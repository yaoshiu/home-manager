require("core.pack").add({
	"https://github.com/stevearc/overseer.nvim",
})

require("overseer").setup()

require("core.keymaps").add({
	{ "<leader>or", "<cmd>OverseerRun<CR>", desc = "Overseer run" },
	{ "<leader>ot", "<cmd>OverseerToggle<CR>", desc = "Overseer toggle" },
})
