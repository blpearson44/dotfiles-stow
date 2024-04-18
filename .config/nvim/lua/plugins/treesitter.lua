return {
    -- Oh sweet sweet treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
        config = function ()
            require'nvim-treesitter.configs'.setup{
                highlight = { enable = true, additional_vim_regex_highlighting = true},
                ensure_installed = { 'lua', 'markdown', 'markdown_inline', 'python', 'yaml', 'json', 'javascript'},
                auto_install = true,
                indent = { enable = true },
            }
            vim.g.foldmethod='expr'
            vim.g.foldexpr='nvim_treesitter#foldexpr()'
        end
    },
}
