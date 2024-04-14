-- adds a nice floating command line so I don't have to look down all the time.
return {
    'VonHeikemen/fine-cmdline.nvim',
    event = 'VeryLazy',
    dependencies = 'MunifTanjim/nui.nvim',
    config = function()
        local cmdline = require 'fine-cmdline'
        vim.keymap.set('n', ':', cmdline.open)
    end
}
