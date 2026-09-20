require("core.pack").add({
    "https://github.com/rafamadriz/friendly-snippets",
	"https://github.com/saghen/blink.lib",
	"https://github.com/saghen/blink.cmp",
})

local cmp = require("blink.cmp")
cmp.build():pwait()

local function jump_out_of_pair()
	local col = vim.api.nvim_win_get_cursor(0)[2]
	local next_char = vim.api.nvim_get_current_line():sub(col + 1, col + 1)

	if next_char:match("[%)%]%}%\"']") then
		return "<Right>"
	end
end

cmp.setup({
	keymap = {
		preset = "default",
		["<Tab>"] = { "snippet_forward", "select_next", jump_out_of_pair, "fallback" },
		["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
		["<CR>"] = { "accept", "fallback" },
	},
	completion = {
		list = {
			selection = {
				preselect = false,
			},
		},
	},
})
