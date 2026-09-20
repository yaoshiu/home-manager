local M = {}

local initialized = false

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

function M.add(spec)
	M.setup()
	vim.pack.add(spec)
end

return M
