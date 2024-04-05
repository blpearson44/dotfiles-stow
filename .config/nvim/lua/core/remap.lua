vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set('n', '<leader>wv', vim.cmd.vsplit)
vim.keymap.set('n', '<leader>wh', vim.cmd.split)

vim.api.nvim_create_autocmd('filetype', {
  pattern = 'netrw',
  desc = 'Better mappings for netrw',
  callback = function()
    local bind = function(lhs, rhs)
      vim.keymap.set('n', lhs, rhs, {remap = true, buffer = true})
    end 

    -- edit new file
    bind('n', '%')

    -- rename file
    bind('r', 'R')
    -- Use H and L to go into or out of files
    bind('h', '-')
    bind('l', '<CR>')
  end
})
