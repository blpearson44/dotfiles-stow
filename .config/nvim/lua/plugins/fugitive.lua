return {
    'tpope/vim-fugitive',
    cmd = 'Git',
    keys = {
        {'<leader>gg', vim.cmd.Git, {desc = "Fugititve git status."}},
        {'<leader>gau', vim.cmd.Git('add -u'), {desc = "Git add all updated."}},
        {'<leader>gaw', vim.cmd.Git('add -u'), {desc = "Git add all updated."}},
    },
}
