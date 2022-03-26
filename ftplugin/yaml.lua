local yamlls_opts = {
  settings = {
    yaml = {
      hover = true,
      completion = true,
      validate = true,
      schemaStore = {
        enable = true,
        url = "https://www.schemastore.org/api/json/catalog.json",
      },
      schemas = {
        kubernetes = {
          "daemon.{yml,yaml}",
          "manager.{yml,yaml}",
          "restapi.{yml,yaml}",
          "kubectl-edit*.yaml",
        },
        ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master/configmap.json"] = "*onfigma*.{yml,yaml}",
        ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master/deployment.json"] = "*eployment*.{yml,yaml}",
        ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master/service.json"] = "*ervic*.{yml,yaml}",
        ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master/ingress.json"] = "*ngres*.{yml,yaml}",
        ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master/secret.json"] = "*ecre*.{yml,yaml}",
      },
    },
  },
}

-- local servers = require "nvim-lsp-installer.servers"

-- local yamlls_available, yamlls = servers.get_server "yamlls"
-- if yamlls_available then
--   yamlls_opts.cmd_env = yamlls:get_default_options().cmd_env
-- end

-- local spectral_opts = {}

-- local spectral_available, spectral = servers.get_server "spectral"
-- if spectral_available then
--   spectral_opts.cmd = spectral:get_default_options().cmd
-- end
-- require("lvim.lsp.manager").setup("spectral", {})

require("lvim.lsp.manager").setup("yamlls", yamlls_opts)
