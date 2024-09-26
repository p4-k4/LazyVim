local ignore_filetypes = { "neo-tree", "NvimTree" }
local ignore_buftypes = { "NvimTree", "nofile", "prompt", "popup" }

local augroup = vim.api.nvim_create_augroup("FocusDisable", { clear = true })

vim.api.nvim_create_autocmd("WinEnter", {
  group = augroup,
  callback = function(_)
    if vim.tbl_contains(ignore_buftypes, vim.bo.buftype) then
      vim.b.focus_disable = true
    end
  end,
  desc = "Disable focus autoresize for BufType",
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  callback = function(_)
    if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
      vim.b.focus_disable = true
    end
  end,
  desc = "Disable focus autoresize for FileType",
})

return {
  "nvim-focus/focus.nvim",
  version = "*",
  opts = { enable = true, commands = true },

  keys = {
    { "<leader>wj", "<cmd>FocusSplitDown<cr>" },
    { "<leader>wk", "<cmd>FocusSplitUp<cr>" },
    { "<leader>wh", "<cmd>FocusSplitLeft<cr>" },
    { "<leader>wl", "<cmd>FocusSplitRight<cr>" },
  },
}
