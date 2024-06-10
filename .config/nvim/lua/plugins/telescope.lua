return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                config = function()
                    require('telescope').setup{
                        extensions = {
                            fzf = {
                                fuzzy = true,                    -- false will only do exact matching
                                override_generic_sorter = true,  -- override the generic sorter
                                override_file_sorter = true,     -- override the file sorter
                                case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                            }
                        }
                    }
                    require('telescope').load_extension('fzf')
                    require('telescope').load_extension('nerdy')
                end
            }
        },
        event = 'VimEnter',
        config = function()
            local telescope = require 'telescope'
            local builtin = require 'telescope.builtin'
            local actions = require 'telescope.actions'
            local utils = require 'telescope.utils'
            vim.keymap.set('n', '<leader>sf', function()
                builtin.find_files({cwd=utils.buffer_dir()})
            end, {})
            vim.keymap.set('n', '<c-p>', builtin.git_files, {})
            vim.keymap.set('n', '<leader><leader>', builtin.buffers)
            vim.keymap.set('n', '<leader>gb', builtin.git_branches)
            vim.keymap.set('n', '<leader>gc', builtin.git_commits)
            vim.keymap.set('n', '<leader>gf', builtin.git_bcommits)
            vim.keymap.set('n', '<leader>gs', builtin.git_status)
            vim.keymap.set('n', '<leader>ss', function()
                builtin.live_grep({cwd=utils.buffer_dir()})
            end)

            telescope.setup{
                defaults = {
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
        end
    }
}
