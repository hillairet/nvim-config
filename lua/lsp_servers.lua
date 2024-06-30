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
        flake8 = { enabled = true, ignore = { "E203" }, maxLineLength = 99 },
        isort = { enabled = true, profile = "black", line_length = 99, multi_line_output = 3 },
        mypy = { enabled = true },
        black = { enabled = true, line_length = 99, skip_string_normalization = true },
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
}
