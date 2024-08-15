return {
    "lukas-reineke/indent-blankline.nvim", main = "ibl",
    opts = {
        scope = {
            enabled = true,
        },
        exclude = {
            filetypes = {"neogit", "help", "terminal", "dashboard"},
            buftypes = {"terminal"}
        },
        indent = {
            char = '╎',
        }
    }
}
