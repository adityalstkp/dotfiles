return {
    {
        'mason-org/mason-lspconfig.nvim',
        lazy = vim.fn.argc(-1) == 0, -- load lsp early when opening a file from the cmdline
        event = { 'VeryLazy' },
        opts = {
            ensure_installed = {
                "lua_ls",
                "vtsls",
                "eslint",
                "gopls",
                "rust_analyzer",
            }
        },
        dependencies = {
            "neovim/nvim-lspconfig",
            { 'williamboman/mason.nvim', config = true },
            { 'j-hui/fidget.nvim',       opts = {} },
        },
        config = function()
            -- Ensure the servers above are installed
            local mason = require 'mason'

            mason.setup()

            -- TODO: delete if it's not necessary anymore
            -- local get_git_root_dir = function(fname)
            --     local util = require 'lspconfig.util'
            --     return util.root_pattern '.git' (fname)
            -- end

            local capabilities = require('blink.cmp').get_lsp_capabilities()

            -- NOTES: disabled for tsgo
            -- vim.lsp.config('vtsls', {
            --     settings = require 'lsp_config.vtsls'.settings
            -- })

            vim.lsp.config('lua_ls', {
                settings = require 'lsp_config.lua_ls'.settings,
            })

            vim.lsp.config('rust_analyzer', {})

            local eslint_lsp = require 'lsp_config.eslint'
            vim.lsp.config('eslint', {
                cmd = eslint_lsp.cmd,
                settings = eslint_lsp.settings
            })

            vim.lsp.config('gopls', {
                settings = require 'lsp_config.gopls'.settings
            })

            vim.lsp.config('tsgo', {
                settings = require 'lsp_config.vtsls'.settings
            })

            vim.lsp.config('*', {
                capabilities = capabilities,
            })

            vim.lsp.enable({
                'lua_ls',
                -- 'vtsls',
                'tsgo',
                'rust_analyzer',
                'eslint',
                'gopls',
            })
        end,
    }
}
