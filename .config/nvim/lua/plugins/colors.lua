return {
    -- Coloscheme
    {
        "olimorris/onedarkpro.nvim", priority = 1000, lazy = false,
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    {
        "catppuccin/nvim", name = "catppuccin", priority = 1000,
        config = function ()
            require("catppuccin").setup({
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    nvimtree = true,
                    treesitter = true,
                    notify = true,
                    mini = {
                        enabled = true,
                        indentscope_color = "",
                    },
                    noice = true,
                    gitgutter = true,
                    native_lsp = {
                        enabled = true,
                        virtual_text = {
                            errors = { "italic" },
                            hints = { "italic" },
                            warnings = { "italic" },
                            information = { "italic" },
                            ok = { "italic" },
                        },
                        underlines = {
                            {nil}
                        },
                        inlay_hints = {
                            background = true,
                        },
                    },               }
            })
            vim.cmd.colorscheme("catppuccin-mocha")
        end
    }
}
