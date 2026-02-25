return {
  -- Detect tabstop and shiftwidth automatically
  { 'tpope/vim-sleuth', event = 'VeryLazy' },
  -- Add indentation guides even on blank lines
  {
    'saghen/blink.indent',
    event = 'VeryLazy',
    opts = {},
  },
  {
    "suvasanket/oz.nvim",
    event = 'VeryLazy',
    opts = {},
  },
  {
    "rcarriga/nvim-notify",
    event = 'VeryLazy',
  },
}
