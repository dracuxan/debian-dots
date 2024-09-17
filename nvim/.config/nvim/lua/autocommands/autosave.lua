vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("AutoRun", {clear = true}),
  pattern = {"main.go", "example.go"},
  callback = function ()
    vim.cmd("! make run")
  end,
})
