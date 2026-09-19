return {
	spec = { { src = "https://github.com/akinsho/toggleterm.nvim", version = vim.version.range("*") } },
	config = function()
		local toggleterm = require("toggleterm")
		toggleterm.setup({
			on_open = function(t)
				vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = t.buf, silent = true })
			end,
		})

		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
		vim.keymap.set("n", "<leader>g", function()
			lazygit:toggle()
		end, { desc = "Toggle Lazygit" })

		local floatterm = Terminal:new({ hidden = true, direction = "float" })
		vim.keymap.set("n", "<leader><leader>", function()
			floatterm:toggle()
		end, { desc = "Toggle floating terminal" })
	end,
}
