require("core.pack").add({
	"https://github.com/rafamadriz/friendly-snippets",
	"https://github.com/saghen/blink.lib",
	{
		src = "https://github.com/saghen/blink.cmp",
		data = {
			config = function()
				local cmp = require("blink.cmp")
				local force = false
				local strip = vim.env.CARGO_PROFILE_RELEASE_STRIP
				if vim.fn.has("mac") == 1 then
					-- LLVM's debug stripping can produce dylibs rejected by macOS 27.
					if cmp.library_available() then
						local name, path = require("blink.cmp.fuzzy").get_lib()
						force = package.loadlib(path, "luaopen_" .. name) == nil
					end
					vim.env.CARGO_PROFILE_RELEASE_STRIP = "none"
				end
				local ok, err = cmp.build({ force = force }):pwait()
				vim.env.CARGO_PROFILE_RELEASE_STRIP = strip
				assert(ok, err)

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
			end,
		},
	},
})
