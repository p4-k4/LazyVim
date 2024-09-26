local cmp = require("cmp")

return {
  "hrsh7th/nvim-cmp",
  opts = {
    mapping = {
      ["<C-j>"] = cmp.mapping.select_next_item(),
      ["<C-k>"] = cmp.mapping.select_prev_item(),
    },
    window = {
      documentation = {
        border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
        winhighlight = "Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None",
      },
      completion = {
        border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
        winhighlight = "Insert:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None",
      },
    },
  },
}
