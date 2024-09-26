local actions = require("telescope.actions")

return {

  "nvim-telescope/telescope.nvim",
  keys = {
    { "<leader>fR", false },
    { "<leader>/", ":Telescope file_browser path=%:p:h select_buffer=true previewer=false<cr>" },
    { "<leader>'", ":Telescope project<cr>" },
    { "<leader>.", "<cmd>Telescope find_files<cr>" },
    { "<leader>,", "<cmd>Telescope buffers<cr>" },
    { "<leader>K", "<cmd>Telescope keymaps<cr>" },
    { "<leader>td", "<cmd>Telescope diagnostics<cr>" },
    { "<leader>tt", "<cmd>Telescope colorscheme<cr>" },
  },
  opts = {
    defaults = {
      pickers = {
        sort_lastused = true,
      },
      mappings = {
        i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
        },
      },
    },
  },
}
