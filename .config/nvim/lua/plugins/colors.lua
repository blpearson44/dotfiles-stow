return {
    -- Coloscheme
    {
        "catppuccin/nvim", name = "catppuccin", priority = 1000, lazy = false,
        config = function (colorscheme)
            if colorscheme == nil then
                colorscheme = 'catppuccin-mocha'
            end
            vim.cmd.colorscheme("catppuccin-mocha")
            vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"})
            -- Set custom highlight colors for vim-visual-multi
        end
    },
}
