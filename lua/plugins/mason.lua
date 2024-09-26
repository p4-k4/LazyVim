-- ~/.config/nvim/lua/plugins/mason.lua
return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "hls" },  -- Changed from "haskell-debug-adapter" to "hls"
        automatic_installation = true,
      })
    end,
  },
}
