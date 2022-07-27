local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "horizon.lsp.lsp-installer"
require("horizon.lsp.handlers").setup()
require "horizon.lsp.null-ls"
