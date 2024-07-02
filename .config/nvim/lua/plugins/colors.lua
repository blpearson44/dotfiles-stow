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
                color_overrides = {
                    mocha = {
                        rosewater = "#efc9c2",
                        flamingo = "#ebb2b2",
                        pink = "#f2a7de",
                        mauve = "#b889f4",
                        red = "#ea7183",
                        maroon = "#ea838c",
                        peach = "#f39967",
                        yellow = "#eaca89",
                        green = "#96d382",
                        teal = "#78cec1",
                        sky = "#91d7e3",
                        sapphire = "#68bae0",
                        blue = "#739df2",
                        lavender = "#a0a8f6",
                        text = "#b5c1f1",
                        subtext1 = "#a6b0d8",
                        subtext0 = "#959ec2",
                        overlay2 = "#848cad",
                        overlay1 = "#717997",
                        overlay0 = "#63677f",
                        surface2 = "#505469",
                        surface1 = "#3e4255",
                        surface0 = "#2c2f40",
                        base = "#1a1c2a",
                        mantle = "#141620",
                        crust = "#0e0f16",
                    },
                },
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
