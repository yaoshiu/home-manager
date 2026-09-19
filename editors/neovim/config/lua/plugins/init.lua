local plugins = {
	require("themes.solarized"),
	require("plugins.lspconfig"),
	require("plugins.treesitter"),
	require("plugins.which-key"),
	require("plugins.telescope"),
	require("plugins.treesitter-context"),
	require("plugins.ts-autotag"),
	require("plugins.autopairs"),
	require("plugins.blink-cmp"),
	require("plugins.indent-blankline"),
	require("plugins.bufferline"),
	require("plugins.mini-surround"),
	require("plugins.gitsigns"),
	require("plugins.flash"),
	require("plugins.toggleterm"),
	require("plugins.fidget"),
	require("plugins.lsp_signature"),
	require("plugins.lualine"),
}

local builds = {}
for _, plugin in ipairs(plugins) do
	for _, spec in ipairs(plugin.spec) do
		if type(spec) == "table" and spec.data and spec.data.build then
			builds[spec.src] = spec.data.build
		end
	end
end

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local build = builds[ev.data.spec.src]
		local kind = ev.data.kind

		if build and (kind == "install" or kind == "update") then
			vim.system(build, { cwd = ev.data.path })
		end
	end,
})

for _, plugin in ipairs(plugins) do
	vim.pack.add(plugin.spec)
end

for _, plugin in ipairs(plugins) do
	if plugin.config then
		plugin.config()
	end
end
