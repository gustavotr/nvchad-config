require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = {
    "angularls",
    "cssls",
    "denols",
    "eslint",
    "html",
    "jsonls",
    "tsserver",
    "lua_ls",
    "prosemd_lsp",
    "rust_analyzer",
    "sqlls",
    "yamlls",
  },
  automatic_installation = true,
}

require("mason-lspconfig").setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup {}
  end,
  -- Next, you can provide a dedicated handler for specific servers.
  -- For example, a handler override for the `rust_analyzer`:
  -- ["rust_analyzer"] = function()
  --   require("rust-tools").setup {}
  -- end,
  ["yamlls"] = function()
    require("yamlls").setup {
      settings = {
        yaml = {
          schemas = {
            kubernetes = "globPattern"
          }
        }
      }
    }
  end,
}
