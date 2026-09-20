local M = {}

local pending = {}
local initialized = false

function M.add(spec)
	if initialized then
		require("which-key").add(spec)
		return
	end

	table.insert(pending, spec)
end

function M.add_group(keys, name)
	M.add({ { keys, group = name } })
end

function M.setup()
	if initialized then
		return
	end
	initialized = true

    local which_key = require("which-key")
	which_key.setup()

	for _, spec in ipairs(pending) do
		which_key.add(spec)
	end
	pending = {}
end

return M
