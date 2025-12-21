return {
  'akinsho/bufferline.nvim',
  event = 'VeryLazy',
  version = '*',
  config = function()
    local buffline = require 'bufferline'
    buffline.setup {
      options = {
        show_buffer_icons = false,
        show_buffer_close_icons = false,
      },
    }

    vim.keymap.set('n', '<leader>bp', '<CMD>BufferLinePick<CR>', { desc = 'Pick buffer' })
    vim.keymap.set('n', '<leader>bc', '<CMD>BufferLinePickClose<CR>', { desc = 'Close buffer' })
    vim.keymap.set('n', '<S-l>', '<CMD>BufferLineCycleNext<CR>', { desc = 'Switch to next buffer' })
    vim.keymap.set('n', '<S-h>', '<CMD>BufferLineCyclePrev<CR>', { desc = 'Switch to prev. buffer' })
  end,
}
