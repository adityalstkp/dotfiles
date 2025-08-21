return {
  -- bigfile handle
  {
    'LunarVim/bigfile.nvim',
    config = function()
      require("bigfile").setup {
        filesize = 1,      -- size of the file in MiB, the plugin round file sizes to the closest MiB
        pattern = { "*" }, -- autocmd pattern or function see <### Overriding the detection of big files>
        features = {       -- features to disable
          "indent_blankline",
          "illuminate",
          "lsp",
          "treesitter",
          "syntax",
          "matchparen",
          "vimopts",
          "filetype",
        }
      }
    end
  },
  -- Detect tabstop and shiftwidth automatically
  { 'tpope/vim-sleuth',      event = 'VeryLazy' },
  -- Add indentation guides even on blank lines
  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'VeryLazy',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
  },
  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', event = 'VeryLazy', opts = {} },
}
