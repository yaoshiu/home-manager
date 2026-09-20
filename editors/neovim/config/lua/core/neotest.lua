local M = {}

local adapters = {}
local initialized = false

function M.add_adapter(name, factory)
	if adapters[name] then
		return
	end

	local adapter = factory()
	adapters[name] = adapter

	if initialized then
		table.insert(require("neotest.config").adapters, adapter)
	end
end

function M.setup(config)
	if initialized then
		return require("neotest")
	end

	config = vim.tbl_deep_extend("force", config or {}, {
		adapters = vim.tbl_values(adapters),
	})

	require("neotest").setup(config)
	initialized = true

	return require("neotest")
end

return M
