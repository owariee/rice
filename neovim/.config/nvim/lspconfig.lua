local lspconfig = require 'lspconfig'

local f_on_attach = function(client, bufnr)
    require "lsp_signature".on_attach()
end

lspconfig.cmake.setup { on_attach = f_on_attach, }
lspconfig.clangd.setup { on_attach = f_on_attach, }

-- Lua config
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lspconfig.sumneko_lua.setup {
  cmd = { "lua-language-server", "-E /usr/share/lua-language-server/main.lua" };
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = runtime_path,
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
  on_attach = f_on_attach,
}

