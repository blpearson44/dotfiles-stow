return {
    -- Automatically determine tab widths
    'tpope/vim-sleuth',
    -- Autopair
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },
    -- Fuzzy Finder
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' },
        event = 'VimEnter',
        config = function()
            local builtin = require 'telescope.builtin'
            vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
            vim.keymap.set('n', '<c-p>', builtin.git_files, {})
            vim.keymap.set('n', '<leader>ps', function()
                builtin.grep_string({ search = vim.fn.input("Grep > ")});
            end)
        end
    },
    -- Coloscheme
    {
        "catppuccin/nvim", name = "catppuccin", priority = 1000, lazy = false,
        config = function ()
            vim.cmd.colorscheme("catppuccin-mocha")
            vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"})
        end
    },
    -- Oh sweet sweet treesitter
    {
        'nvim-treesitter/nvim-treesitter', 
        build = ":TSUpdate",
        config = function ()
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },
    'mbbill/undotree',
    -- Tmux integration
    {
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },
        keys = {
            { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
    },
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
    -- Comment with gcc
    { 'numToStr/Comment.nvim', opts = {} },
    -- Gitsigns
    {
        'lewis6991/gitsigns.nvim',
        opts = {
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
        },
    },
}
