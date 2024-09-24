return {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = 'markdown',
    version = '*',
    lazy = true,
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
    opts = {
        preset = 'obsidian',
    }
}
