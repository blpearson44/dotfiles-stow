return {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = 'markdown',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
    opt = {
        render_modes = { 'n', 'v', 'i', 'c' }
    }
}
