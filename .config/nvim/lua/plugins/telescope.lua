return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' },
        event = 'VimEnter',
        config = function()
            local builtin = require 'telescope.builtin'
            vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
            vim.keymap.set('n', '<c-p>', builtin.git_files, {})
            vim.keymap.set('n', '<leader><leader>', builtin.buffers)
            vim.keymap.set('n', '<leader>gb', builtin.git_branches)
            vim.keymap.set('n', '<leader>gc', builtin.git_commits)
            vim.keymap.set('n', '<leader>gf', builtin.git_bcommits)
            vim.keymap.set('n', '<leader>gs', builtin.git_status)
            vim.keymap.set('n', '<leader>ss', builtin.grep_string)
            require('telescope').setup{
                pickers = {
                    buffers = {
                        ignore_current_buffer = true,
                        sort_mru = true
                    }
                }
            }
        end
    }
}
