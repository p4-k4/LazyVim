-- if true then
--   return {}
-- end

return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")

    lspconfig.dartls.setup({})
  end,
}
