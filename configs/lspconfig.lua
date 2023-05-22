local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = {
  "angularls",
  "cssls",
  "eslint",
  "html",
  "jsonls",
  "tsserver",
  "lua_ls",
  "prosemd_lsp",
  "rust_analyzer",
  "sqlls",
  "yamlls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

--
-- lspconfig.pyright.setup { blabla}
--

lspconfig.yamlls.setup {
  settings = {
    yaml = {
      schemas = {
        kubernetes = "globPattern",
      },
    },
  },
}
