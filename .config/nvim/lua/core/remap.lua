vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- Window managemnet using wincmd
vim.keymap.set('n', '<leader>wv', vim.cmd.vsplit, {desc = "Open Vertical Split."})
vim.keymap.set('n', '<leader>wh', vim.cmd.split, {desc = "Open Horizontal Split."})
vim.keymap.set('n', '<leader>wc', vim.cmd.clo, {desc = "Close pane."})
vim.keymap.set('n', '<leader>wo', vim.cmd.only, {desc = "Close all other panes."})
vim.keymap.set('n', '<leader>ti', function()
  local comment_string = vim.bo.commentstring
  local todo_text = "TODO: "
  if comment_string:find("%%s") then
    todo_text = comment_string:gsub("%%s", todo_text)
  else
    todo_text = comment_string:gsub("%s*$", "") .. " " .. todo_text
  end
  vim.api.nvim_put({todo_text}, "", true, true)
  vim.cmd('startinsert')
end, {desc = "Insert TODO Comment"})
-- Multicursor
vim.g.VM_maps = {
  ["Find Under"] = "<M-d>",
}
vim.keymap.set({'n', 'v'}, 's', '<Nop>', { noremap = true })

-- Better mappings for netrw (rangerlike)
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

-- Close all floating windows
vim.keymap.set('n', '<leader>wf',
  function()
    local closed_windows = {}
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      local config = vim.api.nvim_win_get_config(win)
      if config.relative ~= "" then  -- is_floating_window?
        vim.api.nvim_win_close(win, false)  -- do not force
        table.insert(closed_windows, win)
      end
    end
    print(string.format('Closed %d windows: %s', #closed_windows, vim.inspect(closed_windows)))
  end)
