return {
    "nvim-neorg/neorg",
    dependencies = { "luarocks.nvim" , "nvim-neorg/neorg-telescope", "nvim-neorg/tree-sitter-norg-table", "pritchett/neorg-capture",
        { "pysan3/neorg-templates", dependencies = { "L3MON4D3/LuaSnip" } },
        'pritchett/neorg-capture'
    },
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
                ["core.dirman"] = {
                    config = {
                        workspaces = {
                            notes = "~/neorg",
                            work = "~/neorg/lnw"
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
                            keybinds.remap_key("norg", "n", "<C-Space>", "<C-c><C-c>")
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
                ["external.capture"] = {
                    config = {
                        templates = {
                            {
                                description = "Inbox: Work note",
                                name = "note",
                                file = "inbox.norg",
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
        vim.keymap.set('n', '<leader>nf', '<cmd>Telescope neorg find_norg_files<CR>')
        vim.keymap.set('n', '<leader>nm', '<cmd>Neorg inject-metadata<CR>')
    end,
}
