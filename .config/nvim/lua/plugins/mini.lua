--[
-- Mini provides a bunch of small modules with good inital configs
-- I am using:
-- mini.ai for better inside/around objects
-- mini.statusline for a modeline
--]
return {
    {
        'echasnovski/mini.nvim', version = "*",
        config = function()
            -- Better inside/around objects
            require('mini.surround').setup()
            require('mini.ai').setup { n_lines = 500 }
            local statusline = require 'mini.statusline'
            statusline.setup { use_icons = vim.g.have_nerd_font }
            statusline.section_location = function()
                return '%2l:%-2v'
            end
            local files = require('mini.files')
            files.setup {
                mappings = {
                    go_in_plus = 'l'
                },
                windows = {
                    preview = true,
                    width_preview = 50
                }
            }
            vim.keymap.set('n', '<leader>pv',
                function()
                    MiniFiles.open(vim.api.nvim_buf_get_name(0))
                end)

        end
    },
}
