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
        version = '*',
        dependencies = {
            "nvim-lua/plenary.nvim",         -- required
            "sindrets/diffview.nvim",        -- optional - Diff integration
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            local neogit = require('neogit')
            neogit.setup {}
            vim.keymap.set('n', '<leader>gg', neogit.open)
        end
    },
    {
        "sindrets/diffview.nvim",
        event = "UIEnter",
        config = function()
            vim.keymap.set('n', '<leader>gd', vim.cmd.DiffviewFileHistory)
        end
    }
}
