return {
    'nvimdev/lspsaga.nvim',
    config = function()
        require('lspsaga').setup({})
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons',     -- optional
    },
    lazy = true,
    cmd = {
        'Lspsaga'
    },
    keys = {
        {'<leader>lc', '<cmd>Lspsaga code_action<cr>', desc = 'Code action'}
    }
}
