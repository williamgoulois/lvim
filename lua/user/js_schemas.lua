-- https://www.schemastore.org/json/
local M = {}

M.setup = function()
	local schemas = {
		{
			description = "ESLint config",
			fileMatch = { ".eslintrc.js", ".eslintrc.*.js" },
			url = "http://json.schemastore.org/eslintrc",
		},
		{
			description = "Editorconfig file",
			fileMatch = { ".editorconfig" },
			url = "https://raw.githubusercontent.com/editorconfig/editorconfig-defaults/master/editorconfig-defaults.schema.json",
		},
	}

	lvim.lang.javascript.lsp.setup.settings = {
		javascript = {
			schemas = schemas,
		},
	}
end

return M
