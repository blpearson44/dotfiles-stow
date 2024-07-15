return {
    "sindrets/diffview.nvim",
    event = "UIEnter",
    config = function()
        vim.keymap.set('n', '<leader>gd', vim.cmd.DiffviewFileHistory)
    end
}
