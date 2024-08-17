return {
    'stevearc/oil.nvim',
    dependencies = {'nvim-tree/nvim-web-devicons'},
    lazy = true,
    config = function()
        local oil = require('oil')
        oil.setup({
            keymaps = {
                ["g?"] = "actions.show_help",
                ["q"] = "actions.close",
                ["<CR>"] = "actions.select",
                ["<C-h>"] = false,
                ["C-->"] = "actions.select_vsplit",
                ["<C-->"] = "actions.select_split",
                ["<C-p>"] = false,
                ["<C-c>"] = "actions.preview",
                ["<C-l>"] = false,
                ["-"] = "actions.parent",
                ["_"] = "actions.open_cwd",
                ["`"] = "actions.cd",
                ["~"] = "actions.tcd",
                ["gs"] = "actions.change_sort",
                ["gx"] = "actions.open_external",
                ["g."] = "actions.toggle_hidden",
                ["g\\"] = "actions.toggle_trash",
            },
            view_options = {
                show_hidden = true,
                is_always_hidden = function(name)
                    return vim.startswith(name, "..")
                end,
            },
        })
    end
}
