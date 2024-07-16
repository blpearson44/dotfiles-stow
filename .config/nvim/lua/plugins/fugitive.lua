return {
    'tpope/vim-fugitive',
    cmd = 'Git',
    keys = {
        {'<leader>gg', vim.cmd.Git, {desc = "Fugititve git status."}},
        {'<leader>gw', vim.cmd.Gwrite, {desc = "Git add all updated."}},
    },
    opt = {}
}
