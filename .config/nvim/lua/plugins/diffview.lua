return {
    "sindrets/diffview.nvim",
    event = "UIEnter",
    config = function()
        vim.keymap.set('n', '<leader>gd', vim.cmd.DiffviewFileHistory, {desc="View diffview history for current file."})
    end
}
