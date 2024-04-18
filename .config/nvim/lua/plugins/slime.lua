return {
    'jpalardy/vim-slime',
    event = 'VeryLazy',
    config = function()
        vim.g.slime_target = "tmux"
    end
}
