return {
	spec = {
		"https://github.com/saghen/blink.lib",
		"https://github.com/saghen/blink.cmp",
	},
	config = function()
		local cmp = require("blink.cmp")
		cmp.build():pwait()

		cmp.setup({
			keymap = {
				preset = "default",
				["<Tab>"] = { "snippet_forward", "select_next", "fallback" },
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
	end,
}
