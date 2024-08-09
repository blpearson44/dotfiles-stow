return {
    'pwntester/octo.nvim',
    cmd = 'Octo',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
        -- OR 'ibhagwan/fzf-lua',
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        require"octo".setup()
        require("which-key").add({
            mode = {'n'},
            {"<leader>o", group="octo"}
        })
        vim.keymap.set('n', '<leader>oil', vim.cmd.octo("list"), {desc = "List all issues for the current repository."})
        vim.keymap.set('n', '<leader>oic', vim.cmd.octo("create"), {desc = "Create new issue."})
    end
}

