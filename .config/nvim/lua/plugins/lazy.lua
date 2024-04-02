local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
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
	dependencies = { 'nvim-lua/plenary.nvim' }
    },
    -- Coloscheme
    {
	"catppuccin/nvim", name = "catppuccin", priority = 1000
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


})
