return {
  -- clangd = {},
  -- gopls = {},
  pyright = {},
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
