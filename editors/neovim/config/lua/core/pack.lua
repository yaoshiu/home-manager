local M = {}

local initialized = false
local specs = {}
local spec_indices = {}
local loaded = false

function M.setup()
	if initialized then
		return
	end
	initialized = true

	vim.api.nvim_create_autocmd("PackChanged", {
		callback = function(ev)
			local build = ev.data.spec.data and ev.data.spec.data.build
			if build and (ev.data.kind == "install" or ev.data.kind == "update") then
				local result = vim.system(build, { cwd = ev.data.path }):wait()
				if result.code ~= 0 then
					vim.notify(
						("Failed to build %s:\n%s"):format(ev.data.spec.name, result.stderr),
						vim.log.levels.ERROR
					)
				end
			end
		end,
	})
end

-- Register declarations and defer configuration until every plugin is available.
function M.add(plugins)
	assert(not loaded, "Register plugins before core.pack.load()")
	for _, spec in ipairs(plugins) do
		local src = type(spec) == "string" and spec or spec.src
		local index = spec_indices[src]
		if not index then
			specs[#specs + 1] = spec
			spec_indices[src] = #specs
		elseif type(spec) == "table" then
			assert(
				type(specs[index]) == "string" or vim.deep_equal(specs[index], spec),
				"Conflicting plugin specs: " .. src
			)
			specs[index] = spec
		end
	end
end

function M.load()
	if loaded then
		return
	end
	loaded = true
	M.setup()
	vim.pack.add(specs)
	for _, spec in ipairs(specs) do
		local config = type(spec) == "table" and spec.data and spec.data.config
		if config then
			config()
		end
	end
end

return M
