return {
    "ggandor/leap.nvim",
    event = "UIEnter",
    dependencies = { "tpope/vim-repeat" },
    config = function()
        require('leap').create_default_mappings()
    end
}
