return {
    'Tyler-Barham/floating-help.nvim',
    event = 'UIEnter',
    config = function()
        local fh = require 'floating-help'
        fh.setup({
            -- Defaults
            width = 80,   -- Whole numbers are columns/rows
            height = 0.9, -- Decimals are a percentage of the editor
            position = 'E',   -- NW,N,NW,W,C,E,SW,S,SE (C==center)
            border = 'rounded', -- rounded,double,single
            onload = function(query_type) end, -- optional callback to be executed after help contents has been loaded
        })
        -- Create a keymap for toggling the help window
        vim.keymap.set('n', '<F1>', fh.toggle)
        -- Create a keymap to search cppman for the word under the cursor
        vim.keymap.set('n', '<F2>', function()
            fh.open('t=cppman', vim.fn.expand('<cword>'))
        end)
        -- Create a keymap to search man for the word under the cursor
        vim.keymap.set('n', '<F3>', function()
            fh.open('t=man', vim.fn.expand('<cword>'))
        end)

        -- Only replace cmd, not search; only replace the first instance
-- Define a command-line abbreviation to replace :h with :FloatingHelp

        -- Redirect `:h` to `:FloatingHelp`
    end
}
