return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  opts = {
    autoformat = true,
  },
  config = function()
    local lspconfig = require("lspconfig")
    
    -- Setup for Haskell Language Server
    lspconfig.hls.setup({
      cmd = { "haskell-language-server-wrapper", "--lsp" }
    })
    
    -- Setup for Bash Language Server
    lspconfig.bashls.setup({})
    
    -- Setup for Lua Language Server
    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
          },
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
          },
          telemetry = {
            enable = false,
          },
        },
      },
    })
    
    -- Setup for Dart Language Server
    lspconfig.dartls.setup({})

    vim.diagnostic.config({
      virtual_text = false,
    })
  end,
}
