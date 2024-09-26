return {
  "akinsho/flutter-tools.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim", -- optional for vim.ui.select
  },
  keys = {

    { "<leader>fd", "<cmd>FlutterDevices<cr>" },
    { "<leader>fD", "<cmd>FlutterDetach<cr>" },
    { "<leader>ff", "<cmd>FlutterRun<cr>" },
    { "<leader>fq", "<cmd>FlutterQuit<cr>" },
    { "<leader>fr", "<cmd>FlutterReload<cr>" },
    { "<leader>fR", "<cmd>FlutterRestart<cr>" },
    { "<leader>fpu", "<cmd>FlutterPubUpgrade<cr>" },
    { "<leader>fpg", "<cmd>FlutterPubGet<cr>" },
  },
  config = true,
  opts = {

    device = true,
    widget_guides = {
      enabled = true,
    },
    ui = {
      border = "rounded",
      notification_style = "native",
    },
    decorations = {
      statusline = {
        app_version = false,
        device = true,
      },
    },
    debugger = {
      enabled = false,
      run_via_dap = false,
    },

    lsp = {
      color = { -- show the derived colours for dart variables
        enabled = false, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
        background = false, -- highlight the background
        background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
        foreground = false, -- highlight the foreground
        virtual_text = false, -- show the highlight using virtual text
        virtual_text_str = "■", -- the virtual text character to highlight
      },
      settings = {
        showTodos = true,
        completeFunctionCalls = true,
        -- analysisExcludedFolders = { "<path-to-flutter-sdk-packages>" },
        renameFilesWithClasses = "prompt", -- "always"
        enableSnippets = true,
        updateImportsOnRename = true, -- Whether to update imports and other directives when files are renamed. Required for `FlutterRename` command.
      },
    },
  },

  register_configurations = function(_)
    require("dap").adapters.dart = {
      type = "executable",
      command = vim.fn.stdpath("data") .. "/mason/bin/dart-debug-adapter",
      args = { "debug-adapter" },
      options = {
        detached = false,
      },
    }

    require("dap").configurations.dart = {
      {
        type = "dart",
        request = "launch",
        name = "Test flutter",
        dartSdkPath = "/opt/homebrew/bin/",
        flutterSdkPath = "/opt/homebrew/bin/",
        program = "${file}",
        cwd = "${workspaceFolder}",
      },
    }
    -- uncomment below line if you've launch.json file already in your vscode setup
    -- require("dap.ext.vscode").load_launchjs()
  end,
}
