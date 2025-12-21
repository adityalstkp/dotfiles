return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config  = function()
        require "toggleterm".setup {
            open_mapping = [[<C-t>]], -- or { [[<c-\>]], [[<c-¥>]] } if you also use a Japanese keyboard.
            direction = 'float',
            float_opts = {
                border = 'curved',
                width = math.floor(0.7 * vim.fn.winwidth(0)),
                height = math.floor(0.85 * vim.fn.winheight(0)),
                winblend = 4,
            },
            winbar = {
                enabled = true,
            },
        }
    end
}
