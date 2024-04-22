return {
    'stevearc/oil.nvim',
    dependencies = {'nvim-tree/nvim-web-devicons'},
    event = 'VimEnter',
    config = function()
        local oil = require('oil')
        local actions = require('oil.actions')
        -- vim.keymap.set('n', '<leader>pv', oil.open_float)
        vim.keymap.set('n', '<leader>pp', function()
            if vim.o.filetype == 'oil' then
                actions.select.callback()
                return
            end
            require('oil').open()
            require('oil.util').run_after_load(0, function()
                oil.select({ preview = true })
            end)
        end)
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
