return {
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
        vim.keymap.set('n', '<leader>gg', neogit.open, {desc="Open neogit interactive git buffer."})
    end
}
