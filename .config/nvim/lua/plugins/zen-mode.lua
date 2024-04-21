return {
    "folke/zen-mode.nvim",
    event = 'UIEnter',
    dependencies = { 'twilight.nvim' },
    opts = {
        on_open = function(win)
            vim.o.scrolloff = 20
        end,
        on_close = function()
            vim.o.scrolloff = 11
        end,
    },
    config = function()
        local zen = require('zen-mode')
        vim.keymap.set('n', '<leader>zt', zen.toggle)
    end
}
