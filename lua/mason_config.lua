-- mason-lspconfig requires that these setup functions are called in this order
-- before setting up the servers.
require('mason').setup()
require('mason-tool-installer').setup({
  -- List all the tools you want to ensure are installed
  ensure_installed = {
    "flake8",
    "black",
    "isort",
    "mypy",
  },
  -- Run the installation (if missing) right away when nvim starts
  run_on_start = true,
  -- Or you can set auto_update to true if you'd like to update these tools automatically
  auto_update = false,
})
