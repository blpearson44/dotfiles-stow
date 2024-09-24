vim.g.have_nerd_font = true
vim.g.python3_host_prog = "/home/ben/.local/venv/bin/python3"
vim.opt.autochdir = true
vim.opt.expandtab = true
vim.opt.tabstop=4
vim.opt.shiftwidth=4
vim.opt.softtabstop=4
vim.opt.linebreak = true

-- Show line numbers
vim.opt.number = true
-- Allow mouse usage
vim.opt.mouse = 'a'
-- Don't show the mode
vim.opt.showmode = false
-- Use system register
vim.opt.clipboard = 'unnamedplus'
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = false
vim.opt.scrolloff = 11
vim.opt.hlsearch = true
-- Folding
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevelstart = 99
-- Cancel highlights from search on esc
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- fix pasting in WSL2
local in_wsl = os.getenv('WSL_DISTRO_NAME') ~= nil

if in_wsl then
  vim.g.clipboard = {
    name = 'wsl clipboard',
    copy = { ["+"] = { "clip.exe" }, ["*"] = { "clip.exe" }},
    paste = { ["+"] = { "nvim_paste" }, ["*"] = { "nvim_paste" }},
    cache_enabled = true
  }
end



-- local function cmd_abbrev(abbrev, expansion)
--   local cmd = 'cabbr ' .. abbrev .. ' <c-r>=(getcmdpos() == 1 && getcmdtype() == ":" ? "' .. expansion .. '" : "' .. abbrev .. '")<CR>'
--   vim.cmd(cmd)
-- end
-- -- Redirect `:h` to `:FloatingHelp`
-- cmd_abbrev('h',         'vert h')
-- cmd_abbrev('help',      'vert help')
-- Multicursors highlight matches in red
vim.g.VM_highlight_matches = 'red'
