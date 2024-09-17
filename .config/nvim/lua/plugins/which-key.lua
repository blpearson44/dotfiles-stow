return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    config = function()
        local wk = require("which-key")
        wk.setup({
            icons = {
                separator = '  '
            }
        })
        wk.add({
            {'<leader>g', group = "git", desc = 'Git commands'},
            {'<leader>n', group = "Notes", desc = 'Obsidian Commands'},
            {'<leader>t', group = "Todo", desc = "Todo"},
            {'<leader>w', group = "Window", desc = 'Window commands'},
            {'<leader>p', group = "Project", desc = 'Project views'}
        })

    end
}
