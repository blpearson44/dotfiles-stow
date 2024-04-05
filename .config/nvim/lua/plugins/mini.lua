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
            require('mini.ai').setup { n_lines = 500 }
            local statusline = require 'mini.statusline'
            statusline.setup { use_icons = vim.g.have_nerd_font }
            statusline.section_location = function()
                return '%2l:%-2v'
            end
        end
    },
}
