-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.

--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
require('lazy').setup({
  require 'plugins.language_server_protocol',

  require 'plugins.linting',

  require 'plugins.formatting',

  require 'plugins.autocompletion',

  require 'plugins.keymap_help',

  require 'plugins.git',

  require 'plugins.theme',

  require 'plugins.status_line',

  require 'plugins.indentation',

  require 'plugins.comments',

  require 'plugins.fuzzy_finder',

  require 'plugins.code_abstraction_layer',

  -- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
  --       These are some example plugins that I've included in the kickstart repository.
  --       Uncomment any of the lines below to enable them.
  -- require 'kickstart.plugins.autoformat',
  -- require 'kickstart.plugins.debug',

  require 'plugins.user_interface',

  require 'plugins.file_explorer',

  require 'plugins.markdown',

  require 'plugins.plantuml',
}, {})
