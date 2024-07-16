vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.wo.conceallevel = 2
    end,
})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.ps1",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})
