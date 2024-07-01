return {
  -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  -- Defer Treesitter setup after first render to improve startup time of 'nvim {filename}'
  event = 'VimEnter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  build = ':TSUpdate',
  config = require 'plugins.code_abstraction_layer.config',
}
