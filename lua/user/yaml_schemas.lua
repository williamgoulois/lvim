-- https://www.schemastore.org/json/
local M = {}

M.setup = function()
  local schemas = {
    {
      description = "Github Workflow file (Github Actions)",
      fileMatch = { ".github/workflows/*.yml",".github/workflows/*.yaml"  },
      url = "https://json.schemastore.org/github-workflow.json",
    },
  }

  lvim.lang.yaml.lsp.setup.settings = {
    yaml = {
      schemas = schemas,
    },
  }
end

return M
