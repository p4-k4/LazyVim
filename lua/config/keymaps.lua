local keymap = vim.keymap

-- Write buffer
keymap.set("n", "<leader>fs", "<cmd>w<cr>", { desc = "Save current buffer" })

-- Show hover
keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover information" })

-- Jump to definition
keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Jump to definition" })

-- Jump to declaration
keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Jump to declaration" })

-- Show implementations
keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "List implementations" })

-- Jump to type definition
keymap.set("n", "gt", vim.lsp.buf.type_definition, { desc = "Jump to type definition" })

-- Show references
keymap.set("n", "gr", vim.lsp.buf.references, { desc = "List references" })

-- Rename symbol
keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })

-- Show signature help
keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Show signature help" })

-- Open code actions using the default lsp UI
keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })

-- Format document
keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format document" })

-- Workspace management
keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "Add workspace folder" })
keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { desc = "Remove workspace folder" })
keymap.set("n", "<leader>wl", function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { desc = "List workspace folders" })

-- Diagnostic navigation
keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostics in floating window" })
keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Add diagnostics to location list" })

-- Open code actions using the default lsp UI
keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
