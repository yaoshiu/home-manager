return {
	spec = { "https://github.com/folke/flash.nvim" },
	config = function()
		local flash = require("flash")
		vim.keymap.set({ "n", "x", "o" }, "s", flash.jump, { desc = "Flash" })
		vim.keymap.set({ "n", "x", "o" }, "S", flash.treesitter, { desc = "Flash Treesitter" })
	end,
}
