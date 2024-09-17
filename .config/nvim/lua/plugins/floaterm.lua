return {
    'voldikss/vim-floaterm',
    keys = {
        { '<leader>gi', '<cmd>FloatermNew --width=0.9 --height=0.9 lazygit<cr>', desc="Lazygit float term"},
        { '<leader>tn', '<cmd>FloatermNew! --width=0.75 --height=0.75 --cwd=<buffer><cr>'}
    },
    cmd = 'FloatTermNew',
    lazy = true,
    opts = {}
}
