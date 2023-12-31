vim.cmd.colorscheme 'flexoki-dark'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
vim.o.hlsearch = true

-- https://www.jvt.me/posts/2022/03/01/neovim-format-on-save/
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
