return {
    "lukas-reineke/indent-blankline.nvim", main = "ibl",
    opts = {
        scope = {
            enabled = true,
            show_start = false,
            show_end = false,
        },
        exclude = {
            filetypes = {"neogit", "help", "terminal", "dashboard"},
            buftypes = {"terminal"}
        },
        indent = {
            char = "│"
        },
    }
}
