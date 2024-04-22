return {
    'simonmclean/triptych.nvim',
    event = 'VeryLazy',
    dependencies = {
        'nvim-lua/plenary.nvim', -- required
        'nvim-tree/nvim-web-devicons', -- optional
    },
    config = function()
        local trip = require 'triptych'
        trip.setup {
            options = {
                show_hidden = true,
            }
        }
        vim.keymap.set('n', '<leader>pv', ':Triptych<CR>', {silent = true})
    end
}
