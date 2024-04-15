-- This file will contain git-related plugins
return {
    -- Gitsigns
    {
        'lewis6991/gitsigns.nvim',
        opts = {
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = 'ΓÇ╛' },
                changedelete = { text = '~' },
            },
        },
    },

    {
        "NeogitOrg/neogit",
        event = "UIEnter",
        dependencies = {
            "nvim-lua/plenary.nvim",         -- required
            "sindrets/diffview.nvim",        -- optional - Diff integration
        },
        config = function()
            local neogit = require('neogit')
            neogit.setup {}
            vim.keymap.set('n', '<leader>gg', neogit.open)
        end
    }
}
