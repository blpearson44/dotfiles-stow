return {
    'voldikss/vim-floaterm',
    config = function()
        vim.keymap.set('n', '<leader>gi', '<cmd>FloatermNew --width=0.9 --height=0.9 lazygit<cr>')
    end
}
