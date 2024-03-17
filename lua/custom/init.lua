vim.cmd.colorscheme 'flexoki-dark'
vim.cmd [[
autocmd VimEnter * highlight Normal guibg=none
]]

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
vim.o.hlsearch = true


-- keymapping for terminal
vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })

-- Use ALT+{h,j,k,l} to navigate windows from any mode
vim.api.nvim_set_keymap('t', '<A-h>', [[<C-\><C-N><C-w>h]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<A-j>', [[<C-\><C-N><C-w>j]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<A-k>', [[<C-\><C-N><C-w>k]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<A-l>', [[<C-\><C-N><C-w>l]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<A-h>', [[<C-\><C-N><C-w>h]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<A-j>', [[<C-\><C-N><C-w>j]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<A-k>', [[<C-\><C-N><C-w>k]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<A-l>', [[<C-\><C-N><C-w>l]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-h>', [[<C-w>h]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-j>', [[<C-w>j]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-k>', [[<C-w>k]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-l>', [[<C-w>l]], { noremap = true, silent = true })

-- Create an autocommand group for terminal customizations
vim.api.nvim_create_augroup('TerminalCustomizations', { clear = true })
-- Disable line numbers in terminal mode
vim.api.nvim_create_autocmd('TermOpen', {
  group = 'TerminalCustomizations',
  pattern = 'term://*',
  command = 'setlocal nonumber norelativenumber',
})
-- Optionally, re-enable line numbers when leaving terminal mode
vim.api.nvim_create_autocmd('TermClose', {
  group = 'TerminalCustomizations',
  pattern = 'term://*',
  command = 'setlocal number relativenumber',
})

-- Function to toggle the Fugitive Git buffer
function Toggle_Git_Buffer()
  local buffers = vim.api.nvim_list_bufs()
  local fugitive_bufnr = nil

  for _, bufnr in ipairs(buffers) do
    local bufname = vim.api.nvim_buf_get_name(bufnr)
    if bufname:match('^fugitive://.*') then
      fugitive_bufnr = bufnr
      break
    end
  end

  if fugitive_bufnr then
    -- If a Fugitive buffer is found, close it
    vim.api.nvim_buf_delete(fugitive_bufnr, {})
  else
    -- If no Fugitive buffer is found, open one
    vim.cmd('Git')
  end
end

-- Mapping ALT+g to toggle the Fugitive buffer
vim.api.nvim_set_keymap('n', '<A-g>', '<cmd>lua Toggle_Git_Buffer()<CR>', { noremap = true, silent = true })

-- Function to toggle the diagnostic list
function ToggleDiagnosticList()
  -- Check if the location list is open
  if vim.fn.getloclist(0, { winid = 0 }).winid ~= 0 then
    -- Close the location list
    vim.cmd('lclose')
  else
    -- Populate the location list with diagnostics and open it
    vim.diagnostic.setloclist()
  end
end

vim.api.nvim_set_keymap('n', '<A-e>', '<cmd>lua ToggleDiagnosticList()<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<A-x>', '<cmd>ToggleTerm<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<A-x>', '<cmd>ToggleTerm<CR>', { noremap = true, silent = true })


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
