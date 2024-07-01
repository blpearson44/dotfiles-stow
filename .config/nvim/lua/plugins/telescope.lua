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
            vim.keymap.set('n', '<c-p>', function()
                builtin.git_files({
                    cwd=utils.buffer_dir(),
                    builtin.find_files
                })
            end)
            vim.keymap.set('n', '<leader><leader>', builtin.buffers)
            vim.keymap.set('n', '<leader>gb', function()
                builtin.git_branches({cwd=utils.buffer_dir()})
            end)
            vim.keymap.set('n', '<leader>gc', function()
                builtin.git_commits({cwd=utils.buffer_dir()})
            end)
            vim.keymap.set('n', '<leader>gf', function()
                builtin.git_bcommits({cwd=utils.buffer_dir()})
            end)
            vim.keymap.set('n', '<leader>gs', function()
                builtin.git_status({cwd=utils.buffer_dir()})
            end)
            vim.keymap.set('n', '<leader>ss', function()
                builtin.live_grep({cwd=utils.buffer_dir()})
            end)

            telescope.setup{
                defaults = {
                    sorting_strategy = "ascending",
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
        end
    }
}
