return {
	spec = { { src = "https://github.com/akinsho/toggleterm.nvim", version = vim.version.range("*") } },
	config = function()
		local toggleterm = require("toggleterm")
		toggleterm.setup({})

		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
		vim.keymap.set("n", "<leader>g", function()
			lazygit:toggle()
		end, { desc = "Toggle Lazygit" })
	end,
}
