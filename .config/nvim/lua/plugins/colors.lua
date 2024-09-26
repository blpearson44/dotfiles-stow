return {
    -- Coloscheme
    {
        "olimorris/onedarkpro.nvim", enabled = false, lazy = false,
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        enabled = false,
        priority = 1000,
        opts = {},
    },
    {
        "catppuccin/nvim", name = "catppuccin", priority = 1000,
        config = function ()
            require("catppuccin").setup({
                color_overrides = {
                },
                integrations = {
                    cmp = true,
                    telescope = {
                        enabled = true,
                    },
                    gitsigns = true,
                    nvimtree = true,
                    treesitter = true,
                    notify = true,
                    mini = {
                        enabled = true,
                        indentscope_color = "",
                    },
                    noice = true,
                    octo = true,
                    markdown = true,
                    dashboard = true,
                    gitgutter = true,
                    leap = true,
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
                    },}
            })
            vim.cmd.colorscheme("catppuccin-mocha")
        end
    }
}
