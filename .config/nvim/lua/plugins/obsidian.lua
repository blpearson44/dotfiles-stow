return {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim",
        -- Optional
        'nvim-telescope/telescope.nvim',
        'hrsh7th/nvim-cmp',
        'nvim-treesitter',
    },
    opts = {
        workspaces = {
            {
                name = "Spiderverse",
                path = "~/Spiderverse"
            },
        },
        daily_notes = {
            folder = "daily"
        }
    },
}
