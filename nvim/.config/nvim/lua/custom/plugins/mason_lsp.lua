return {
  {
    'mason-org/mason-lspconfig.nvim',
    lazy = vim.fn.argc(-1) == 0, -- load lsp early when opening a file from the cmdline
    event = { 'VeryLazy' },
    opts = {
      ensure_installed = {
        "lua-language-server",
        "vtsls",
        "eslint-lsp",
        "gopls",
        "rust-analyzer",
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
        settings = require 'lsp_config.lsp.vtsls'.settings
      }

      lspconfig.lua_ls.setup {
        capabilities = capabilities,
        root_dir = get_git_root_dir,
        settings = require 'lsp_config.lsp.lua_ls'.settings,
      }

      lspconfig.rust_analyzer.setup {
        capabilities = capabilities,
        settings = require 'lsp_config.lsp.lua_ls'.settings,
      }

      local eslint_lsp = require 'lsp_config.lsp.eslint'
      lspconfig.eslint.setup {
        cmd = eslint_lsp.cmd,
        capabilities = capabilities,
        root_dir = get_git_root_dir,
        settings = eslint_lsp.settings
      }

      lspconfig.gopls.setup {
        cmd = eslint_lsp.cmd,
        capabilities = capabilities,
        root_dir = get_git_root_dir,
        settings = require 'lsp_config.lsp.gopls'.settings
      }
    end,
  }
}
