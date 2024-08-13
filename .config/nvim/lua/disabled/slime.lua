return {
    'jpalardy/vim-slime',
    ft = "python",
    config = function()
        vim.g.slime_target = "tmux"
    end
}
