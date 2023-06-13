local DEBUGGER_PATH = vim.fn.stdpath "data" .. "/lazy/vscode-js-debug"

require("dap-vscode-js").setup {
  node_path = "node",
  debugger_path = DEBUGGER_PATH,
  -- debugger_cmd = { "js-debug-adapter" },
  adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
}

for _, language in ipairs { "typescript", "javascript" } do
  require("dap").configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
      skipFiles = { "<node_internals>/**", "**/node_modules/**" },
    },
    {
      name = "Attach",
      type = "pwa-node",
      request = "attach",
      cwd = "${workspaceFolder}",
      sourceMaps = true,
      protocol = "inspector",
      skipFiles = { "<node_internals>/**", "**/node_modules/**" },
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach to process",
      processId = require("dap.utils").pick_process,
      cwd = "${workspaceFolder}",
      skipFiles = { "<node_internals>/**", "**/node_modules/**" },
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "Debug Jest Tests",
      -- trace = true, -- include debugger info
      runtimeExecutable = "node",
      runtimeArgs = {
        "./node_modules/jest/bin/jest.js",
        "--runInBand",
      },
      rootPath = "${workspaceFolder}",
      cwd = "${workspaceFolder}",
      console = "integratedTerminal",
      internalConsoleOptions = "neverOpen",
      skipFiles = { "<node_internals>/**", "**/node_modules/**" },
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "NPM Run",
      runtimeExecutable = "npm",
      runtimeArgs = {
        "run",
        function()
          return coroutine.create(function(dap_run_co)
            vim.ui.input({
              prompt = "Name of the script: ",
              default = "",
            }, function(scriptName)
              coroutine.resume(dap_run_co, scriptName)
            end)
          end)
        end,
      },
      rootPath = "${workspaceFolder}$",
      cwd = "${workspaceFolder}",
      skipFiles = { "<node_internals>/**", "**/node_modules/**" },
    },
  }
end

for _, language in ipairs { "typescriptreact", "javascriptreact" } do
  require("dap").configurations[language] = {
    {
      name = "Attach",
      type = "pwa-node",
      request = "attach",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = "inspector",
      skipFiles = { "**/node_modules/**" },
    },
    {
      type = "pwa-chrome",
      name = "Attach - Remote Debugging",
      request = "attach",
      program = "${file}",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = "inspector",
      port = 9222,
      webRoot = "${workspaceFolder}",
      skipFiles = { "**/node_modules/**" },
    },
    {
      type = "pwa-chrome",
      name = "Launch Chrome",
      request = "launch",
      url = "http://localhost:3000",
      skipFiles = { "**/node_modules/**" },
    },
  }
end

local dap = require "dap"
local dapui = require "dapui"
dapui.setup {}

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

local dap_breakpoint = {
  error = {
    text = "🟥",
    texthl = "LspDiagnosticsSignError",
    linehl = "",
    numhl = "",
  },
  rejected = {
    text = "",
    texthl = "LspDiagnosticsSignHint",
    linehl = "",
    numhl = "",
  },
  stopped = {
    text = "⭐️",
    texthl = "LspDiagnosticsSignInformation",
    linehl = "DiagnosticUnderlineInfo",
    numhl = "LspDiagnosticsSignInformation",
  },
}

vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)
