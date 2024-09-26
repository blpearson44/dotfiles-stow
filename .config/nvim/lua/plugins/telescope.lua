return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                config = function()
                end
            }
        },
        event = 'VimEnter',
        config = function()
            local telescope = require 'telescope'
            local builtin = require 'telescope.builtin'
            local actions = require 'telescope.actions'
            local utils = require 'telescope.utils'
            local colors = require 'catppuccin.palettes'.get_palette('mocha')
            vim.keymap.set('n', '<leader>sf', function()
                builtin.find_files({cwd=utils.buffer_dir()})
            end, {})
            vim.keymap.set('n', '<c-p>', function()
                builtin.git_files({
                    cwd=utils.buffer_dir(),
                    builtin.find_files
                })
            end)
            vim.keymap.set('n', '<leader><leader>', builtin.buffers, {desc="List open buffers."})
            vim.keymap.set('n', '<leader>gc', function()
                builtin.git_commits({cwd=utils.buffer_dir()})
            end, {desc = "List git commits for the current repository."})
            vim.keymap.set('n', '<leader>gb', function()
                builtin.git_branches({cwd=utils.buffer_dir()})
            end, {desc = "List git branches for the current repository."})
            vim.keymap.set('n', '<leader>gf', function()
                builtin.git_bcommits({cwd=utils.buffer_dir()})
            end, {desc = "Git commits for current buffer with diff preview."})
            vim.keymap.set('n', '<leader>ss', function()
                builtin.live_grep({cwd=utils.buffer_dir()})
            end, {desc = "Search for string in current directory."})
            vim.keymap.set('n', '<leader>tl', function()
                builtin.grep_string({
                    cwd="~/Spiderverse/",
                    search = "- [ ]",
                    grep_open_files = false,
                    only_sort_text = true,
                    disable_coordinates = true
                })
            end, {desc = "List markdown todos across all notes."})
            -- vim.keymap.set('n', '<leader>nj', function()
            --     builtin.find_files({cwd="~/neorg/notes/journal"})
            -- end, {desc = "Find journal entry"})
            -- vim.keymap.set('n', '<leader>nd', '<cmd>Neorg journal today<cr>', {desc = "Today's journal entry"})

            telescope.setup{
                extensions = {
                    fzf = {
                        fuzzy = true,                    -- false will only do exact matching
                        override_generic_sorter = true,  -- override the generic sorter
                        override_file_sorter = true,     -- override the file sorter
                        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                    }
                },
                defaults = {
                    borderchars = {
                        { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
                        prompt = {"─", " ", " ", "│", '┌', '─', " ", "│"},
                        results = {" ", " ", "─", "│", "│", " ", "─", "└"},
                        preview = { '─', '│', '─', ' ', '─', '┐', '┘', '─'},
                    },
                    winblend = 5,
                    results_title = false,
                    sorting_strategy = "ascending",
                    prompt_prefix = '   ',
                    selection_caret = ' 󰜴 ',
                    layout_config = {
                        prompt_position = 'top',
                        anchor = 'top'
                    },
                    grep_open_files = false,
                    mappings = {
                        i = {
                            ["<C-j>"] = {
                                actions.move_selection_next, type = "action",
                                opts = { nowait = true, silent = true }
                            },
                            ["<C-k>"] = {
                                actions.move_selection_previous, type = "action",
                                opts = { nowait = true, silent = true }
                            }
                        }
                    }
                },
                pickers = {
                    buffers = {
                        ignore_current_buffer = true,
                        sort_mru = true
                    },
                    live_grep = {
                        cwd = utils.buffer_dir()
                    }
                }
            }
            require('telescope').load_extension('fzf')
            require('telescope').load_extension('nerdy')
        end
    }
}
