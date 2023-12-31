vim.cmd.colorscheme 'flexoki-dark'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
vim.o.hlsearch = true

-- https://www.jvt.me/posts/2022/03/01/neovim-format-on-save/
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

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
