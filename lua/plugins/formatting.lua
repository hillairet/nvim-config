return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    -- Variable to track formatting state
    vim.g.auto_format = true

    conform.setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" },
      },
      format_on_save = function(bufnr)
        -- Only format if auto_format is enabled
        if vim.g.auto_format then
          return {
            lsp_fallback = true,
            async = false,
            timeout_ms = 500,
          }
        end
      end,
    })

    -- Toggle formatting function
    local function toggle_format()
      vim.g.auto_format = not vim.g.auto_format
      print("Auto format " .. (vim.g.auto_format and "enabled" or "disabled"))
    end

    -- Manual format keymap
    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      })
    end, { desc = "Format file or range (in visual mode)" })

    -- Toggle format keymap
    vim.keymap.set("n", "<leader>mf", toggle_format, { desc = "Toggle auto format" })
  end,
}
