return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = { "dart" },
    highlight = {
      enable = true,
      custom_captures = {
["function.dart"] = "Identifier",
      }
    },
  },

}
