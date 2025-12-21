return {
  {
    'saghen/blink.compat',
    -- use v2.* for blink.cmp v1.*
    version = '2.*',
    -- lazy.nvim will automatically load the plugin when it's required by blink.cmp
    lazy = true,
    -- make sure to set opts so that lazy.nvim calls blink.compat's setup
    opts = {},
  },
  {
    'saghen/blink.cmp',
    lazy = false, -- lazy loading handled internally
    -- optional: provides snippets for the snippet source
    dependencies = {
      'rafamadriz/friendly-snippets',
      'folke/lazydev.nvim',
    },
    -- use a release tag to download pre-built binaries
    version = '1.*',
    -- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' for mappings similar to built-in completion
      -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
      -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
      -- see the "default configuration" section below for full documentation on how to define
      -- your own keymap.
      keymap = { preset = 'super-tab' },
      signature = { enabled = true },
      appearance = {
        nerd_font_variant = 'mono',
      },
      completion = {
        menu = {
          border = 'rounded',
          draw = {
            columns = { { 'label', 'label_description', gap = 1 }, { 'kind', 'source_name', gap = 1 } },
          },
        },
        accept = {
          auto_brackets = {
            enabled = false,
          },
        },
        documentation = {
          auto_show = true,
          window = { border = 'rounded' },
        },
      },
      -- default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, via `opts_extend`
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', 'lazydev', 'trae' },
        providers = {
          lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
          trae = {
            name = 'trae',
            module = 'blink.compat.source',
            opts = {},
            async = true,
          },
        },
        -- optionally disable cmdline completions
        -- cmdline = {},
      },
      fuzzy = { implementation = 'prefer_rust_with_warning' },
      -- experimental signature help support
      -- signature = { enabled = true }
    },
    -- allows extending the providers array elsewhere in your config
    -- without having to redefine it
    opts_extend = { 'sources.default' },
  },
}
