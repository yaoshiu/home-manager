require("core.pack").add({ "https://github.com/folke/flash.nvim" })

local flash = require("flash")
local keymaps = require("core.keymaps")
keymaps.add({
	{ "s", flash.jump, desc = "Flash", mode = { "n", "x", "o" } },
	{ "S", flash.treesitter, desc = "Flash Treesitter", mode = { "n", "x", "o" } },
})
