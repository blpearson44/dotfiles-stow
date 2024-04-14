-- Better in-file search and replacing. Much nicer looking.
return {
    'VonHeikemen/searchbox.nvim',
    dependencies = 'MunifTanjim/nui.nvim',
    event = 'VeryLazy',
    config = function()
        local search = require 'searchbox'
        vim.keymap.set('n', '/', function()
            search.incsearch({
                show_matches = true
            })
        end)
        vim.keymap.set('n', '?', function()
            search.incsearch({
                reverse = true,
                show_matches = true
            })
        end)
        vim.keymap.set('n', 'R', function()
            search.replace({
                show_matches = true,
                confirm = 'menu'
            })
        end)
    end

}
