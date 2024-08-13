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
            },
            options = {
                custom_filter = function(buf_number)
                    local exclude_ft = { 'qf', 'fugitive', 'git'}
                    local buf_name = vim.fn.bufname(buf_number)
                    local ft = vim.bo[buf_number].filetype

                    if vim.tbl_contains(exclude_ft, ft) then
                        return false
                    end
                    if buf_name == "" then
                        return false
                    end
                    return true
                end
            }
        }
    end
}
