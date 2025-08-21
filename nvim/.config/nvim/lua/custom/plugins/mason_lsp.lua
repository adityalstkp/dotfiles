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
      local lspconfig = require 'lspconfig'

      mason.setup()

      local get_git_root_dir = function(fname)
        local util = require 'lspconfig.util'
        return util.root_pattern '.git' (fname)
      end

      local capabilities = require('blink.cmp').get_lsp_capabilities()

      lspconfig.vtsls.setup {
        capabilities = capabilities,
        root_dir = get_git_root_dir,
        settings = require 'lsp_config.vtsls'.settings
      }

      lspconfig.lua_ls.setup {
        capabilities = capabilities,
        root_dir = get_git_root_dir,
        settings = require 'lsp_config.lua_ls'.settings,
      }

      lspconfig.rust_analyzer.setup {
        capabilities = capabilities,
        settings = require 'lsp_config.lua_ls'.settings,
      }

      local eslint_lsp = require 'lsp_config.eslint'
      lspconfig.eslint.setup {
        cmd = eslint_lsp.cmd,
        capabilities = capabilities,
        root_dir = get_git_root_dir,
        settings = eslint_lsp.settings
      }

      lspconfig.gopls.setup {
        capabilities = capabilities,
        root_dir = get_git_root_dir,
        settings = require 'lsp_config.gopls'.settings
      }
    end,
  }
}
