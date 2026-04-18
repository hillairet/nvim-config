return {
  "aklt/plantuml-syntax",
  config = function()
    local group = vim.api.nvim_create_augroup("PlantumlAutogen", { clear = true })

    vim.api.nvim_create_autocmd("BufWritePost", {
      group = group,
      pattern = { "*.puml", "*.plantuml" },
      callback = function()
        vim.fn.jobstart({ "plantuml", vim.fn.expand("%:p") })
      end,
    })
  end,
}
