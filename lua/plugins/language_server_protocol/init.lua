-- NOTE: This is where your plugins related to LSP can be installed.
--  The configuration is done below. Search for lspconfig to find it below.
return {
  -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    {
      'mason-org/mason.nvim',
      config = true,
      dependencies = {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
      },
    },
    'mason-org/mason-lspconfig.nvim',

    -- Useful status updates for LSP
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    { 'j-hui/fidget.nvim', opts = {} },
  },
  config = require 'plugins.language_server_protocol.config',
}
