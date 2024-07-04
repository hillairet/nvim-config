local cmp = require("cmp")

-- `/` cmdline setup.
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  completion = { completeopt = 'menu,menuone,noselect' },
  sources = {
    { name = 'buffer' }
  }
})

-- `:` cmdline setup.
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  completion = { completeopt = 'menu,menuone,noselect' },
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    {
      name = 'cmdline',
      option = {
        ignore_cmds = { 'Man', '!' }
      }
    }
  })
})

vim.api.nvim_set_keymap('n', '<A-p>', '<cmd>MarkdownPreviewToggle<CR>', { noremap = true, silent = true })
