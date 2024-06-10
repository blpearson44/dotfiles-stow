return {
    "nvim-neorg/neorg",
    dependencies = { "luarocks.nvim" , "nvim-neorg/neorg-telescope" },
    version = "*",
    config = function()
        require("neorg").setup {
            load = {
                ["core.defaults"] = {},
                ["core.concealer"] = {},
                ["core.integrations.telescope"] = {},
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
                        end,
                    }
                }
            },
        }

        vim.wo.foldlevel = 99
        vim.wo.conceallevel = 2
    end,
}
