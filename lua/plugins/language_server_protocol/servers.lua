return {
  -- clangd = {},
  -- gopls = {},
  pylsp = {
    pylsp = {
      plugins = {
        pycodestyle = { enabled = false },
        autopep8 = { enabled = false },
        yapf = { enabled = false },
        pyflakes = { enabled = false },
        mccabe = { enabled = false },
        flake8 = { enabled = false, ignore = { "E203" }, maxLineLength = 88 },
        isort = { enabled = false, profile = "black", line_length = 88, multi_line_output = 3 },
        mypy = { enabled = false, follow_imports = false },
        black = { enabled = false, line_length = 88 },
        ruff = { enabled = false },
        -- other plugins and settings...
      }
    }
  },
  -- rust_analyzer = {},
  rust_analyzer = {
    check = {
      command = "clippy"
    }
  },
  -- tsserver = {},
  -- html = { filetypes = { 'html', 'twig', 'hbs'} },
  marksman = {},
  texlab = {},
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      -- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
      -- diagnostics = { disable = { 'missing-fields' } },
    },
  },
  dockerls = {},
  docker_compose_language_service = {},
  yamlls = {},
}
