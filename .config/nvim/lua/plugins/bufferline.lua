return {
    'akinsho/bufferline.nvim', version = "*", dependencies = {'nvim-tree/nvim-web-devicons', 'catppuccin/nvim'},
    after = "catppuccin",
    config = function()
        local mocha = require("catppuccin.palettes").get_palette "mocha"
        require("bufferline").setup {
            highlights = require("catppuccin.groups.integrations.bufferline").get {
                styles = { "italic", "bold" },
                custom = {
                    mocha = {
                        fill = {bg = mocha.base}
                    }
                }
            }
        }
    end
}
