return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = 'hyper',
      config = {
        week_header = {
          enable = true,
        },
        shortcut = {
          {desc = '󰚰 Lazy', action = 'Lazy', key = 'p'},
          {desc = ' Files', action = 'MiniFiles.open("~/")', key = 'f'}
        }
      },
      project = {enable = false}
    }
    vim.keymap.set('n', '<leader>db', vim.cmd.Dashboard, {desc = "Open dashboard."})
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
