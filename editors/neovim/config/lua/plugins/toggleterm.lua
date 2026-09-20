require("core.pack").add({ { src = "https://github.com/akinsho/toggleterm.nvim", version = vim.version.range("*") } })

local toggleterm = require("toggleterm")
local keymaps = require("core.keymaps")
toggleterm.setup({
	on_open = function(t)
		keymaps.add({ { "q", "<cmd>close<CR>", mode = "n", buffer = t.buf, silent = true } })
	end,
})

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
keymaps.add({
	{ "<leader>g", function()
		lazygit:toggle()
	end, desc = "Toggle Lazygit", mode = "n" },
})

local floatterm = Terminal:new({ hidden = true, direction = "float" })
keymaps.add({
	{ "<leader><leader>", function()
		floatterm:toggle()
	end, desc = "Toggle floating terminal", mode = "n" },
})
