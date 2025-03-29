-- https://github.com/neovim/nvim-lspconfig/tree/master/lua/lspconfig/configs
vim.lsp.enable({
    'lua_ls',
    'vtsls',
    'eslint',
    'gopls',
})

vim.diagnostic.config({
    virtual_lines = {
        current_line = true
    },
    virtual_text = false,
    severity_sort = true,
})
