---@type vim.lsp.Config
return {
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      workspace = {
        userThirdParty = {
          '~/.local/share/LuaAddons',
        },
        library = {
          vim.env.VIMRUNTIME,
        },
        checkThirdParty = 'Ask',
      },
      telemetry = { enable = false },
      diagnostics = { globals = { 'vim' } },
      hint = {
        enable = true,
      },
    },
  },
}
