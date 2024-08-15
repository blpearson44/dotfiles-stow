return {
    "tadmccorkle/markdown.nvim",
    ft = "markdown", -- or 'event = "VeryLazy"'
    config = function()
        require('markdown').setup({
            mappings = {
                inline_surround_delete = false,
                inline_surround_change = false,
            },
        })
        vim.keymap.set('i', '<M-CR>', '<cmd>MDListItemBelow<CR>')
        vim.keymap.set('i', '<M-o>', '<cmd>MDListItemBelow<CR>')
        vim.keymap.set('i', '<M-O>', '<cmd>MDListItemAbove<CR>')
    end,
}
