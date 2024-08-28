return {
    -- Oh sweet sweet treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
        config = function ()
            require'nvim-treesitter.configs'.setup{
                highlight = { enable = true, additional_vim_regex_highlighting = true},
                ensure_installed = { 'lua', 'markdown', 'markdown_inline', 'python', 'yaml', 'json', 'javascript', 'html', 'norg'},
                auto_install = true,
                indent = { enable = true },
            }
        end
    },
}
