local inlay_hints = {
  parameterNames = {
    enabled = 'all',
  },
  parameterTypes = {
    enabled = true,
  },
  variableTypes = {
    enabled = true,
  },
  propertyDeclarationTypes = {
    enabled = true,
  },
  functionLikeReturnTypes = {
    enabled = true,
  },
  enumMemberValues = {
    enabled = true,
  },
}

---@type vim.lsp.Config
return {
  settings = {
    vtsls = {
      autoUseWorkspaceTsdk = true,
    },
    typescript = {
      inlayHints = inlay_hints,
      tsserver = {
        maxTsServerMemory = 8192,
      },
      preferences = {
        preferTypeOnlyAutoImports = true,
      },
    },
    javascript = {
      inlayHints = inlay_hints,
    },
  },
}
