-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '<A-D>', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', '<A-d>', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

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

-- Clear highlight by pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
