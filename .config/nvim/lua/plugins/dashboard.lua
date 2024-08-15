return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
    }
    vim.keymap.set('n', '<leader>db', vim.cmd.Dashboard, {desc = "Open dashboard."})
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
