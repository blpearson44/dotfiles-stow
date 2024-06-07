return {
    -- Coloscheme
    {
        "olimorris/onedarkpro.nvim", priority = 1000, lazy = false,
        config = function ()
            vim.cmd.colorscheme("onedark")

        end
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    }
}
