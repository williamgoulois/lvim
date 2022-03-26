local jsonls_opts = {}

local servers = require "nvim-lsp-installer.servers"

local jsonls_available, jsonls = servers.get_server "jsonls"
if jsonls_available then
  jsonls_opts.cmd_env = jsonls:get_default_options().cmd_env
end

-- local spectral_opts = {}

-- local spectral_available, spectral = servers.get_server "spectral"
-- if spectral_available then
--   spectral_opts.cmd = spectral:get_default_options().cmd
-- end

require("lvim.lsp.manager").setup("jsonls", jsonls_opts)
-- require("lvim.lsp.manager").setup("spectral", spectral_opts)
