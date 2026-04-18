return function()
  --  This function gets run when an LSP connects to a particular buffer.
  local on_attach = function(_, bufnr)
    -- NOTE: Remember that lua is a real programming language, and as such it is possible
    -- to define small helper and utility functions so you don't have to repeat yourself
    -- many times.
    --
    -- In this case, we create a function that lets us more easily define mappings specific
    -- for LSP related items. It sets the mode, buffer and description for us each time.
    local nmap = function(keys, func, desc)
      if desc then
        desc = 'LSP: ' .. desc
      end

      vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

    nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
    nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    -- See `:help K` for why this keymap
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

    -- Lesser used LSP functionality
    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    nmap('<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
      vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
  end

  -- Enable the following language servers
  --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
  --
  --  Add any additional override configuration in the following tables. They will be passed to
  --  the `settings` field of the server config. You must look up that documentation yourself.
  --
  --  If you want to override the default filetypes that your language server will attach to you can
  --  define the property 'filetypes' to the map in question.
  local servers = require 'plugins.language_server_protocol.servers'

  -- Completion plugin augments LSP capabilities.
  local capabilities = require('blink.cmp').get_lsp_capabilities()

  -- mason-lspconfig requires that these setup functions are called in this order
  require 'plugins.package_manager_config'

  -- Ensure the servers above are installed
  local mason_lspconfig = require 'mason-lspconfig'

  mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers),
    -- mason-lspconfig removed `setup_handlers` and can auto-enable servers.
    -- We handle `lspconfig.setup()` ourselves below to keep all config local.
    automatic_enable = false,
    automatic_installation = true,
  }

  local lspconfigs = require 'lspconfig.configs'

  for server_name, server_config in pairs(servers) do
    -- Newer nvim-lspconfig versions deprecate the `require('lspconfig')[name]` access
    -- pattern on Nvim >= 0.11. Load server configs explicitly to avoid that path.
    local ok, config_def = pcall(require, 'lspconfig.configs.' .. server_name)
    if ok then
      -- Mirror lspconfig's old `__index` behavior: requiring a config module does
      -- not register it, so we assign it into `lspconfig.configs` to build the
      -- actual server object (with `.setup`, manager, etc.).
      lspconfigs[server_name] = config_def
    end
    local server = lspconfigs[server_name]
    if not server then
      vim.notify(string.format('[lspconfig] config "%s" not found', server_name), vim.log.levels.WARN)
      goto continue
    end

    server.setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = server_config,
      filetypes = (server_config or {}).filetypes,
    }

    ::continue::
  end
end
