return {
  {
    'rose-pine/neovim',
    lazy = false,
    priority = 1000,
    name = 'rose-pine',
    config = function()
      require('rose-pine').setup {
        styles = { transparency = true },
      }
      vim.cmd 'colorscheme rose-pine'
    end,
  },
  {
    'ribru17/bamboo.nvim',
    lazy = false,
    priority = 1000,
    enabled = false,
    config = function()
      require('bamboo').setup {
        transparent = true,
      }
      require('bamboo').load()
    end,
  },
}
