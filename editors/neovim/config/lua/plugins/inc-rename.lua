require("core.pack").add({
	"https://github.com/smjonas/inc-rename.nvim",
})

require("inc_rename").setup({})

require("core.keymaps").add({
	{
		"<leader>r",
		function()
			return "<Cmd>IncRename " .. vim.fn.expand("<cword>")
		end,
        desc = "IncRename",
		mode = "n",
		expr = true,
	},
})
