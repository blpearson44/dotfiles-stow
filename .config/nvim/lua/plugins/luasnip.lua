return {
    'L3MON4D3/LuaSnip',
    build = (function()
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
        end
        return 'make install_jsregexp'
    end)(),
    dependencies = {
        {
            'rafamadriz/friendly-snippets',
            config = function()
                require('luasnip.loaders.from_vscode').lazy_load()
            end,
        },
        'nvim-lua/plenary.nvim'
    },
    config = function()
        -- keybinds
        local ls = require("luasnip")

        -- Keymaps for jumping through insert nodes
        vim.keymap.set({ "i", "s" }, "<c-j>", function()
            if ls.jumpable(1) then
                ls.jump(1)
            end
        end, { silent = true })

        vim.keymap.set({ "i", "s" }, "<c-l>", function()
            if ls.jumpable(-1) then
                ls.jump(-1)
            end
        end, { silent = true })
        -- Custom Snips
        local s = ls.snippet
        local i = ls.insert_node
        local fmta = require("luasnip.extras.fmt").fmta
        ls.add_snippets("norg", {
            s("todo", fmta([[
                * ( ) <>
                {}  - ( ) <>
            ]], {
                    i(1, "Heading"),
                    i(2, "task"),
            }))
        })
    end
}
