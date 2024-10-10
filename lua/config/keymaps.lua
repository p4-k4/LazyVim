local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- Navigation layer (Space)
map('n', '<Space>h', '<C-w>h', { desc = 'Go to left window' })
map('n', '<Space>j', '<C-w>j', { desc = 'Go to lower window' })
map('n', '<Space>k', '<C-w>k', { desc = 'Go to upper window' })
map('n', '<Space>l', '<C-w>l', { desc = 'Go to right window' })
map('n', '<Space>n', '5j', { desc = 'Move cursor 5 lines down' })
map('n', '<Space>e', '5k', { desc = 'Move cursor 5 lines up' })

-- File operations layer (,)
map('n', ',w', ':w<CR>', { desc = 'Save file' })
map('n', ',q', ':q<CR>', { desc = 'Quit' })
map('n', ',x', ':x<CR>', { desc = 'Save and quit' })
map('n', ',e', '<cmd>Neotree toggle<cr>', { desc = 'Toggle file explorer' })
map('n', ',f', ':Telescope find_files<CR>', { desc = 'Find files' })
map('n', ',g', ':Telescope live_grep<CR>', { desc = 'Live grep' })
map('n', ',b', ':Telescope buffers<CR>', { desc = 'List buffers' })

-- LSP functions layer (.)
map('n', '.d', vim.lsp.buf.definition, { desc = 'Go to definition' })
map('n', '.D', vim.lsp.buf.declaration, { desc = 'Go to declaration' })
map('n', '.i', vim.lsp.buf.implementation, { desc = 'List implementations' })
map('n', '.t', vim.lsp.buf.type_definition, { desc = 'Go to type definition' })
map('n', '.r', vim.lsp.buf.references, { desc = 'List references' })
map('n', '.n', vim.lsp.buf.rename, { desc = 'Rename symbol' })
map('n', '.s', vim.lsp.buf.signature_help, { desc = 'Show signature help' })
map('n', '.a', vim.lsp.buf.code_action, { desc = 'Code action' })
map('v', '.a', vim.lsp.buf.code_action, { desc = 'Code action' })
map('n', '.f', vim.lsp.buf.format, { desc = 'Format document' })
map('n', '.h', vim.lsp.buf.hover, { desc = 'Show hover information' })

-- Workspace management (on LSP layer)
map('n', '.wa', vim.lsp.buf.add_workspace_folder, { desc = 'Add workspace folder' })
map('n', '.wr', vim.lsp.buf.remove_workspace_folder, { desc = 'Remove workspace folder' })
map('n', '.wl', function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { desc = 'List workspace folders' })

-- Diagnostic navigation (on Navigation layer)
map('n', '<Space>p', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic' })
map('n', '<Space>n', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic' })
map('n', '<Space>d', vim.diagnostic.open_float, { desc = 'Show diagnostics in floating window' })
map('n', '<Space>q', vim.diagnostic.setloclist, { desc = 'Add diagnostics to location list' })

-- Flutter operations layer (;)
map('n', ';d', '<cmd>FlutterDevices<cr>', { desc = 'Flutter Devices' })
map('n', ';D', '<cmd>FlutterDetach<cr>', { desc = 'Flutter Detach' })
map('n', ';r', '<cmd>FlutterRun<cr>', { desc = 'Flutter Run' })
map('n', ';m', '<cmd>FlutterRun --enable-experiment=macros<cr>', { desc = 'Flutter Run with macros expiriment' })
map('n', ';q', '<cmd>FlutterQuit<cr>', { desc = 'Flutter Quit' })
map('n', ';R', '<cmd>FlutterReload<cr>', { desc = 'Flutter Reload' })
map('n', ';s', '<cmd>FlutterRestart<cr>', { desc = 'Flutter Restart' })
map('n', ';u', '<cmd>FlutterPubUpgrade<cr>', { desc = 'Flutter Pub Upgrade' })
map('n', ';g', '<cmd>FlutterPubGet<cr>', { desc = 'Flutter Pub Get' })

-- Quick access to common commands
map('n', '<Space><Space>', ':', { desc = 'Enter command mode' })

-- Alternative mappings for common operations (more Miryoku-friendly)
map('n', 'H', vim.lsp.buf.hover, { desc = 'Show hover information' })
map('n', 'gd', vim.lsp.buf.definition, { desc = 'Jump to definition' })
map('n', 'gD', vim.lsp.buf.declaration, { desc = 'Jump to declaration' })
map('n', 'gi', vim.lsp.buf.implementation, { desc = 'List implementations' })
map('n', 'gt', vim.lsp.buf.type_definition, { desc = 'Jump to type definition' })
map('n', 'gr', vim.lsp.buf.references, { desc = 'List references' })
map('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename symbol' })

-- Use Tab and Shift-Tab for navigating completion menu
map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', { expr = true })
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', { expr = true })

-- Easy search and replace
local function search_and_replace()
  local search = vim.fn.input("Search: ")
  if search == "" then return end
  
  local replace = vim.fn.input("Replace with: ")
  if replace == "" then return end
  
  local confirm = vim.fn.input("Confirm each replacement? (y/n): ")
  local flags = "ge"
  if confirm:lower() == "y" then
    flags = flags .. "c"
  end
  
  local command = string.format("%%s/%s/%s/%s", search:gsub("/", "\\/"), replace:gsub("/", "\\/"), flags)
  vim.cmd(command)
end

-- Add this to your existing mappings
map('n', '<leader>sr', search_and_replace, { desc = 'Search and Replace' })
