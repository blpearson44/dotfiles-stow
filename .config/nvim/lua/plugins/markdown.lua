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
        vim.keymap.set('n', '<M-o>', '<cmd>MDListItemBelow<CR>')
        vim.keymap.set('n', '<M-O>', '<cmd>MDListItemAbove<CR>')
        vim.keymap.set('n', '<C-c><C-c>', '<cmd>MDTaskToggle<CR>')
        vim.keymap.set('n', '<leader>tx', '<cmd>MDTaskToggle<CR>', {desc = "Toggle task status."})
    end,
}
