#LSP & LSP configurations

require("mason").setup()
require("mason-lspconfig").setup()

require("lspconfig").lua_ls.setup {}
require("lspconfig").rust_analyzer.setup {}
require("lspconfig").ts_ls.setup {}
require("lspconfig").jdtls.setup { cmd = { 'jdtls' } }
require("lspconfig").clangd.setup {
  cmd = { "nix-shell", "--run", "clangd", "--background-index" },
  init_options = {
    clangdFileStatus = true
  }
}
require("lspconfig").tailwindcss.setup {}
