-- This file contains one-liner plugins that are added to avoid clutter
return {
    -- Automatically determine tab widths
    'tpope/vim-sleuth',
    'mbbill/undotree',
    { 'windwp/nvim-autopairs', event = "InsertEnter", config = true },
    -- Comment with gcc
    { 'numToStr/Comment.nvim', opts = {} },
    {
        'Aasim-A/scrollEOF.nvim',
        event = { 'CursorMoved', 'WinScrolled' },
        opts = {},
        config = true
    }
}
