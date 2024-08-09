-- This file will contain git-related plugins
return {
    -- Gitsigns
    'lewis6991/gitsigns.nvim',
    event = 'UIEnter',
    opts = {
        signs = {
            add = { text = '+' },
            change = { text = '~' },
            delete = { text = '_' },
            topdelete = { text = 'ΓÇ╛' },
            changedelete = { text = '~' },
        },
    },
}
