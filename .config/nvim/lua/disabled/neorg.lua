return {
    "nvim-neorg/neorg",
    dependencies = {
        -- "luarocks.nvim" ,
        "nvim-neorg/neorg-telescope",
        "nvim-neorg/tree-sitter-norg-table",
        "pritchett/neorg-capture",
        { "pysan3/neorg-templates", dependencies = { "L3MON4D3/LuaSnip" } },
        'pritchett/neorg-capture',
        'bottd/neorg-worklog',
    },
    keys = {
        "<leader>nf",
        '<leader>nn',
        '<leader>nj',
        '<leader>nd'
    },
    cmd = {
        'Neorg'
    },
    ft = 'norg',
    lazy = true,
    version = "*",
    config = function()
        require("neorg").setup {
            load = {
                ["core.defaults"] = {},
                ["core.concealer"] = {},
                ["core.integrations.telescope"] = {},
                ["external.templates"] = {
                    config = {
                        templates_dir = "/home/ben/neorg/templates",
                        default_subcommand = "add"
                    }
                },
                ["external.worklog"] = {
                    -- default config
                    config = {
                        -- Title content for worklog in journal
                        heading = "Worklog",
                        -- Title content for "default" workspace
                        default_workspace_title = "notes"
                    } }, -- NOTE: Neorg dir contains notes and templates
                ["core.dirman"] = {
                    config = {
                        workspaces = {
                            notes = "~/neorg/notes",
                        },
                        default_workspace = "notes",
                    },
                },
                ['core.completion'] = {
                    config = {
                        engine = "nvim-cmp"
                    }
                },
                ['core.summary'] = {
                    config = {
                        strategy = "by_path"
                    }
                },
                ["core.keybinds"] = {
                    config = {
                        hook = function(keybinds)
                            keybinds.unmap("norg", "n", keybinds.leader .. "nn")
                            keybinds.map("norg", "n", keybinds.leader .. "nt", '<cmd>Neorg templates<CR>')
                        end,
                    }
                },
                ["core.journal"] = {
                    config = {
                        strategy = "flat"
                    }
                },
                -- WARN: this does not work right now
                ["external.capture"] = {
                    config = {
                        templates = {
                            {
                                description = "Inbox: Work note",
                                name = "note",
                                file = "/home/ben/neorg/notes/inbox.norg",
                                headline = "Work Notes"
                            },
                            {
                                description = "Inbox: Work task",
                                name = "task",
                                file = "inbox.norg",
                                headline = "Work tasks"
                            }
                        }
                    }
                }
            },
        }
        vim.wo.foldlevel = 99
        vim.wo.conceallevel = 2
        local dirman = require('neorg').modules.get_module("core.dirman")
        vim.keymap.set('n', '<leader>nn', function()
            -- Prompt the user for a filename
            vim.ui.input({ prompt = 'Enter filename: ' }, function(filename)
                local title = ""
                if filename == nil then
                    return
                elseif filename == "" then
                    filename = tostring(os.time())
                else
                    title = filename
                    filename = tostring(os.time()) .. "-" .. filename:gsub(" ", "-"):lower()
                end
                dirman.create_file(filename, "notes", {
                    no_open  = false,
                    force    = false,
                    metadata = {title = title}
                })
            end)
        end, { desc = 'Create new file' })
        vim.keymap.set('n', '<leader>nf', '<cmd>Telescope neorg find_norg_files<CR>', {desc = 'Find notes.'})
        vim.keymap.set('n', '<leader>nm', '<cmd>Neorg inject-metadata<CR>', {desc = 'Inject metadata.'})
        vim.api.nvim_create_autocmd('Filetype', {
            pattern = 'norg',
            callback = function()
                vim.keymap.set("n", '<C-c><C-c>', "<Plug>(neorg.qol.todo-items.todo.task-cycle)", {buffer = true, desc = "Toggle task status"})
            end
        })
        vim.keymap.set('n', '<leader>nt', '<cmd>Neorg templates fload<cr>', {desc = "Load a template"})
    end,
}
